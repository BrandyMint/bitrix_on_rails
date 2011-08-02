# -*- coding: utf-8 -*-
class Iblock < ActiveRecord::Base
  set_table_name :b_iblock

  # version - 1 или 2

  # iblock_type_id это строка, поэтом он срабатывает только если его указывать явано в foreign_key
  belongs_to :iblock_type, :foreign_key=>'iblock_type_id'

  # Они еще связаны между собой через iblock_section_element
  has_many :iblock_sections
  has_many :iblock_elements

  # has_many :iblock_section_elements, :through=>:iblock_sections

  # Список типов свойств по номерам которых создаются поля в
  # таблицах iblock_element_prop_sN
  has_many :iblock_properties

  has_many :iblock_fields
  has_many :iblock_groups

  class << self
    def s_props_class(id)
      # raise 'Только для инфоблоков 2-й версии' unless version==2
      "IblockElementPropS#{id}".constantize
    end

    def m_props_class(id)
      # raise 'Только для инфоблоков 2-й версии' unless version==2
      "IblockElementPropM#{id}".constantize
    end

    def all
      @cached_all ||= super
    end
  end

  def to_s
    name
  end


  def init_property_models
    return unless version==2
    iblock_id = self.id

    # Создаем классы IblockElementPropSНОМЕР
    #
    const_name = "IblockElementPropS#{iblock_id}"
    unless Kernel.const_defined? const_name
      e = Class.new(ActiveRecord::Base) do
        extend BitrixOnRails::IblockElementPropS

       class << self
         @m_prop_class = nil
         @m_props = nil

         def m_prop_class
           Kernel.const_get(@m_prop_class)
         end

         def m_props
           @m_props
         end
       end

       acts_as_iblock_element_prop_s(iblock_id)
     end
     Kernel.const_set const_name, e
   end
   Kernel.const_get(const_name).init

    # Создаем классы IblockElementPropMНОМЕР
   #
   const_name = "IblockElementPropM#{iblock_id}"
   unless Kernel.const_defined? const_name
     e = Class.new(ActiveRecord::Base) do
       extend BitrixOnRails::IblockElementPropM
       acts_as_iblock_element_prop_m(iblock_id)
     end
     Kernel.const_set "IblockElementPropM#{iblock_id}", e
   end
   Kernel.const_get(const_name).init
  end

end
