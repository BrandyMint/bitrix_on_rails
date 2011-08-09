# -*- coding: utf-8 -*-

module BitrixOnRails
  module ActiveRecord

    # TODO: Добавить еще один параметр delegated_methods, через который пользователь сможет определить
    # методы, которые необходимо проделегировать в iblock_element
    def has_infoblock(iblock_id, foreign_key)
      prop_s_name = "iblock_element_prop_s#{iblock_id}".to_sym
      iblock_element_class = BitrixOnRails.infoblocks[iblock_id]

      has_one prop_s_name, :class_name => "::IblockElementPropS#{iblock_id}", :foreign_key => foreign_key , :autosave => true
      full_class_name = self.name
      class_name = full_class_name.split('::').last.underscore.to_sym

      Object.const_get("IblockElementPropS#{iblock_id}").instance_eval {
        belongs_to class_name, :class_name => full_class_name, :foreign_key => foreign_key
      }

      has_one :iblock_element, :class_name => iblock_element_class.name, :through => prop_s_name

      iblock_element_class.iblock_properties.each { |m, property|
        # Во избежание коллизий не стоит делегировать методы вроде post_id, blog_id дальше
        unless m.to_s =~ /_id$/
          delegate m, :to => :iblock_element
          delegate "#{m}=", :to => :iblock_element unless property[:multiple]
        end
      }
    end

  end
end
