# -*- coding: utf-8 -*-

module BitrixOnRails
  module ActiveRecord

    def has_infoblock(iblock_id, property_name, &blk)
      prop_s_name = "iblock_element_prop_s#{iblock_id}".to_sym
      has_one prop_s_name, :foreign_key => property_name, :class_name => "::IblockElementPropS#{iblock_id}", :autosave => true

      element_class = Class.new IblockElement do
        set_iblock_id iblock_id
      end
      element_class.class_eval(&blk) if block_given?

      self.const_set('Element', element_class)

      self.class_eval("def property_set; iblock_element.property_set; endь")
      Iblock.define_delegated_methods(self, iblock_id, true)

      has_one :iblock_element, :through => prop_s_name, :class_name => 'Element', :autosave => true

    end
  end
end
