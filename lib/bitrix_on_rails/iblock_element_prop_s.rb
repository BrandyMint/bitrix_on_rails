# -*- coding: utf-8 -*-
module BitrixOnRails::IblockElementPropS

  class MPropValuesWrapper
    attr_reader :iblock_element_id, :iblock_property_id

    def initialize(iblock_element_id, iblock_property_id, m_prop_class)
      @iblock_element_id = iblock_element_id
      @iblock_property_id = iblock_property_id

      @m_prop_class = m_prop_class
    end

    def values
      @m_prop_class.where(
        :iblock_element_id => @iblock_element_id,
        :iblock_property_id => @iblock_property_id
      ).collect { |e| e.value }
    end

    def add(value)
      @m_prop_class.create(
        :iblock_element_id => @iblock_element_id,
        :iblock_property_id => @iblock_property_id,
        :value => value)
    end

    def remove(value)
      m_props = @m_prop_class.where(
        :iblock_element_id => @iblock_element_id,
        :iblock_property_id => @iblock_property_id,
        :value => value)
      m_props.each { |p| p.destroy } if m_props.any?
    end
  end

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

    @m_props.each { |code, property|
      define_method(code) do
        instance_variable_get("@m_prop_#{property[:id]}".to_sym) ||
        instance_variable_set("@m_prop_#{property[:id]}".to_sym, MPropValuesWrapper.new(self.iblock_element_id, property[:id], m_prop_class))
      end
    }

    before_save do
      self.class.m_props.each { |code, p|
        values = send(code).values
        self.send("property_#{p[:id]}=", ::PHP.serialize({'VALUE' => values, 'DESCRIPTION' => Array.new(values.size, nil)}))
      }
    end
  end

  module ClassMethods
  end

  module InstanceMethods
    def m_prop_class
      self.class.m_prop_class
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
            v = ::PHP.unserialize(value)
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
