# -*- coding: utf-8 -*-
class IblockElement < ActiveRecord::Base
  set_table_name :b_iblock_element

  belongs_to :iblock
  belongs_to :iblock_section

  after_find { Iblock.define_delegated_methods(self, self.iblock_id) }

  # Применяется только для iblock-ов 1-й версии
  #
  has_many :iblock_element_properties

  # Применяется для iblock-ов 2-й версии
  #
  has_many :iblock_section_elements
  has_many :iblock_sections, :through => :iblock_section_elements

  class << self
    def iblock_id
      @iblock_id
    end

    def property_codes
      raise "Не установлен @iblock_id" unless iblock_id
      Iblock.get_property_codes(iblock_id)
    end

    def set_iblock_id(id)
      @iblock_id = id

      prop_s_class = "IblockElementPropS#{id}"
      prop_m_class = "IblockElementPropM#{id}"

      has_one :s_prop, :class_name => "::#{prop_s_class}", :foreign_key => 'iblock_element_id', :autosave => true
      has_many :m_prop_values, :class_name => "::#{prop_m_class}", :foreign_key => 'iblock_element_id', :autosave => true

      default_scope where(:iblock_id => id, :active => 'Y')

      property_codes.each { |code, number|
        define_method(code) do
          property_set.send(code)
        end

        define_method("#{code}=") do |value|
          property_set.send("#{code}=", value)
        end
      }
    end
  end

  def property_codes
    ::Iblock.get_property_codes(self.iblock_id)
  end

  def to_s
    name
  end

  def property_set
    send "iblock_element_prop_s#{iblock_id}"
  end
end
