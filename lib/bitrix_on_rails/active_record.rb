# -*- coding: utf-8 -*-

module BitrixOnRails
  module ActiveRecord

    def has_infoblock(iblock_id, foreign_key)
      prop_s_name = "iblock_element_prop_s#{iblock_id}".to_sym
      iblock_element_class = BitrixOnRails.infoblocks[iblock_id]

      has_one prop_s_name, :class_name => "::IblockElementPropS#{iblock_id}", :foreign_key => foreign_key , :autosave => true
      has_one :iblock_element, :class_name => iblock_element_class.name, :through => prop_s_name

      iblock_element_class.iblock_properties.each { |m|
        delegate m, :to => :iblock_element
      }
    end

  end
end
