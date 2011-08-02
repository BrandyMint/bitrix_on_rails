# -*- coding: utf-8 -*-

module BitrixOnRails
  module ActiveRecord

    def has_infoblock(iblock_id, property_name, &blk)
      prop_s_name = "iblock_element_prop_s#{iblock_id}".to_sym
      has_one prop_s_name, :foreign_key=>property_name, :class_name=>"::IblockElementPropS#{iblock_id}", :autosave => true

      element_class_name = self.name + 'Element'
      unless Kernel.const_defined?(element_class_name)
        element_class = Class.new(IblockElement) do
          set_iblock_id iblock_id
        end

        if block_given?
          element_class.instance_eval(&blk)
        end

        Kernel.const_set(element_class_name, element_class)
      end

      has_one :iblock_element, :through => prop_s_name, :class_name => element_class_name, :autosave => true
    end
  end
end
