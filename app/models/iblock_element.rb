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

  set_table_name :b_iblock_element

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

  def self.define_iblock_class(iblock_id, class_name = nil , options = {})
    iblock_element_class = Class.new(IblockElement) do
      @iblock_id = iblock_id
      @iblock_properties = Iblock.get_property_codes(iblock_id)

      has_one :property_set, :class_name => "IblockElementPropS#{iblock_id}", :foreign_key => 'iblock_element_id', :autosave => true

      default_scope where(:iblock_id => iblock_id)

      @iblock_properties.each { |code, number|
        define_method(code) do
          property_set.send(code)
        end

        define_method("#{code}=") do |value|
          property_set.send("#{code}=", value)
        end
      }
    end

    # Определяем имя класса, который нужно создать, а также namespace, в котором
    # его нужно создать.
    if class_name
      a = class_name.split('::')
      class_name = a.last
      namespace  = a[0..-2].join('::')
    else
      class_name = "IblockElement#{iblock_id}"
      namespace  = Kernel
    end

    Kernel.const_set(class_name, iblock_element_class)

    # Вставляем связи с i_block_element_prop_* на уровень IblockElement. Это может быть полезно
    # в том случае, если пользователь получил объект класса IblockElement, а не того создаваемого.
    # Использование этих связей полностью в компетенции пользователя объекта.
    class IblockElement
      has_one  "iblock_element_prop_s#{iblock_id}"
      has_many "iblock_element_prop_m#{iblock_id}"
    end
  end

  def property_codes
    ::Iblock.get_property_codes(self.iblock_id)
  end

  def to_s
    name
  end
end
