# -*- coding: utf-8 -*-
module BitrixOnRails::IblockElementPropS
  def acts_as_iblock_element_prop_s(iblock_id, iblock_element_class)
    extend ClassMethods
    include InstanceMethods

    @m_prop_class = "IblockElementPropM#{iblock_id}"
    @m_props = {}
    @s_props = {}

    Iblock.get_properties(iblock_id).select { |k,e|
      if e.multiple == 'Y'
        @m_props[e.code] = {:id => e.id, :type => e.property_type}
      else
        @s_props[e.code] = {:id => e.id, :type => e.property_type}
      end
    }

    set_table_name "b_iblock_element_prop_s#{iblock_id}"

    belongs_to :iblock_element, :class_name => iblock_element_class.name

    @s_props.each { |code, property|
      define_method(code) do
        value = send "property_#{property[:id]}"
        unserialize value, property[:type]
      end

      define_method("#{code}=") do |val|
        send"property_#{property[:id]}", serialize(val, property[:type])
      end

      define_method "find_by_#{code}" do |val|
        send "find_by_property#{property[:id]}", serialize(val, property[:type])
      end
    }

    before_save do
      self.class.m_props.each_value { |p|
        values = m_prop_values(p.id)
        self.send("property_#{p.id}=", PHP.serialize({'VALUE' => values, 'DESCRIPTION' => Array.new(values.size, nil)}))
      }
    end
  end

  module ClassMethods
  end

  module InstanceMethods
    # Возвращает десериализованное (при необходимости) значение свойства
    # prop - код свойства (post_id к примеру)
    def get_value(prop)
      send prop
    end

    def m_prop_values(prop_id)
      Iblock.m_props_class(iblock_id).where(:iblock_element_id => self.id, :iblock_property_id => prop_id).collect { |e| e.value }
    end

    def create_m_prop_value(prop_id, value)
      Iblock.m_props_class(iblock_id).create(:iblock_element_id => self.id, :iblock_property_id => prop_id, :value => value)
    end

    def destroy_m_prop_value(prop_id, value)
      m_props = Iblock.m_props_class(iblock_id).where(:iblock_element_id => self.iblock_element_id, :iblock_property_id => prop_id, :value => value)
      m_props.each { |p| p.destroy } if m_props.any?
    end

    # Возможные значения для типов свойств:
    # * S - строка
    # * N - число
    # * F - файл
    # * L - список
    # * E - привязка к элементам
    # * G - привязка к группам.
    def unserialize(value, type)
      case type
        when 'N'
          value.is_a?(BigDecimal) ? value.to_i : value
        when 'S'
          if value.length > 5 && value[0..3] =~ /[a-z]:\d/
            v = PHP.unserialize(value)
            v.is_a?(Hash) && v.include?('TEXT') ? v['TEXT'] : value
          else
            value
          end
          when 'L' # id из таблицы b_iblock_property_enum
            value
        else
          value
      end
    end

    def serialize(value, type)
      value
    end
  end
end
