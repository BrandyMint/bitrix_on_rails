# -*- coding: utf-8 -*-
class IblockElement < ActiveRecord::Base
  class << self
    @block_id = nil
    @iblock_properties = nil

    def iblock_id
      @iblock_id
    end

    def iblock_properties
      @iblock_properties
    end
  end

  set_table_name :b_iblock_element

  belongs_to :iblock
  belongs_to :iblock_section

  # Применяется только для iblock-ов 1-й версии
  #
  has_many :iblock_element_properties

  # Применяется для iblock-ов 2-й версии
  #
  has_many :iblock_section_elements
  has_many :iblock_sections, :through => :iblock_section_elements

  def to_s
    name
  end

  def self.set_iblock_id(id)
    @iblock_id = id
    @iblock_properties = IblockProperty.where(:iblock_id => id).inject({}){ |a,e| a[e.code] = e.id; a }

    prop_s_class = "IblockElementPropS#{id}"
    prop_m_class = "IblockElementPropM#{id}"

    has_one :property_set, :class_name => "::#{prop_s_class}", :foreign_key => 'iblock_element_id', :autosave => true
    has_many :m_prop_values, :class_name => "::#{prop_m_class}", :foreign_key => 'iblock_element_id'

    # Создаем прокси-методы для доступа к значениям свойств элемента
    Kernel.const_get(prop_s_class).properties.each { |code, property_name|
      define_method(code) do
        property_set.send(code)
      end

      define_method("#{code}=") do |value|
        property_set.send("#{code}=", value)
      end
    }

    default_scope where(:iblock_id => id, :active => 'Y')
  end
end
