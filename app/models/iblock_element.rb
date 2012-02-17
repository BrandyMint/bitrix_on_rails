# -*- coding: utf-8 -*-
class IblockElement < ActiveRecord::Base

  class << self
    # Хранит id инфоблока, с которым связан класс. Устанавливается для классов
    # наследуемых от IblockElement.
    @iblock_id = nil

    # Хранит хеш свойств, хранящихся в IblockElementPropS*. Устанавливается для
    # классов наследуемых от IblockElement.
    @iblock_properties = nil

    def iblock_id
      @iblock_id
    end

    def iblock_properties
      @iblock_properties
    end
  end

  self.table_name = :b_iblock_element

  belongs_to :iblock
  belongs_to :iblock_section

  # after_find { Iblock.define_delegated_methods(self, self.iblock_id) }

  # Применяется только для iblock-ов 1-й версии
  #
  has_many :iblock_element_properties

  # Применяется для iblock-ов 2-й версии
  #
  has_many :iblock_section_elements
  has_many :iblock_sections, :through => :iblock_section_elements

  default_scope where(:active => 'Y')

  def property_codes
    ::Iblock.get_property_codes(self.iblock_id)
  end

  def to_s
    name
  end
end
