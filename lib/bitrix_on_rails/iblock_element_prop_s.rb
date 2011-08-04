# -*- coding: utf-8 -*-
module BitrixOnRails::IblockElementPropS
  def acts_as_iblock_element_prop_s(id)
    extend ClassMethods
    include InstanceMethods

    # Убираем лишнюю s вконце
    #set_table_name 'b_'+table_name.chop
    set_table_name "b_iblock_element_prop_s#{id}"

    belongs_to :iblock_element

    # Хеш соответсвия кодов свойств названию полей: post_id -> property_149
    cattr_accessor :properties

    # Хеш свойств объекта по кодам
    attr_accessor :properties

    after_find do
      self.properties = self.class.properties.keys.inject({}) { |hash, prop| hash[prop] = send prop; hash }
    end

    before_save do
      self.class.m_props.each_value { |p|
        values = m_prop_values(p.id)
        self.send("property_#{p.id}=", PHP.serialize({'VALUE' => values, 'DESCRIPTION' => Array.new(values.size, nil)}))
      }
    end

  end

  def create_element_association
    IblockElement.send :has_one, "iblock_element_prop_s#{id}".to_sym, :class_name=>"::IblockElementPropS#{id}"
  end

  module ClassMethods


    def m_props
      # @m_prop_class = "IblockElementPropM#{id}"
      # Название свойства сохраняется только для наглядности, чтобы можно было через консоль понять
      # что за свойство.
      @m_props ||= Iblock.get_properties(iblock_id).select { |k,e| e.multiple == 'Y' }
    end

    # code - врое как кодовое название свойства
    # name - русское описание

    # Дальше идут пары:
    # property_120
    # description_120
    # ..
    # определяются они в iblock.iblock_properties

    # Берем список свойств из таблицы iblock_properties
    # и создаем такие же методы для опроса и установки, чтобы можно было использовать
    # их напрямую:
    #
    #   self.кодовое_имя_свойства
    #
    #   Например:
    #
    #   self.post_id вместо self.property_120
    #

    def iblock_id
      self.name=~/(\d+)/
      $1.to_i
    end

    def init

      # Вот это не срабатывает для Post::Element
      #
      # IblockElement.send :has_one, "iblock_element_prop_s#{iblock_id}".to_sym, :class_name=>Iblock.s_props_class(iblock_id).name, :autosave => true

      self.properties = {}
      attribute_names.select {|a| a[0,4]=='prop' }.each do |name|
        prop_id = name.slice(9,5).to_i
        iblock_property = IblockProperty.find(prop_id)
        code = iblock_property.code.downcase.to_sym
        self.properties[code] = name
        define_method code do
          val = send name
          return val.to_i if val.is_a?(BigDecimal)

          # Вот так мы проверяем сериализацию
          # Есть еще вариант что поле сериализовано если  iblock_property.user_type=='HTML'
          #
          if val.is_a? String and val.length>5 and val[0,3]=~/[a-z]:\d/
            res = PHP.unserialize(val)
            # res = PhpSerialization.load(val)
            return iblock_property.property_type=='S' && res.is_a?(Hash) && res.include?('TEXT') ? res['TEXT'] : res
          end
          val
        end
        define_method "#{code}=" do |val|
          send "#{name}=", val
        end
        eval "def self.find_by_#{code}(val); find_by_#{name}(val); end"
      end
    end
  end

  module InstanceMethods

    def iblock_id
      self.class.to_s=~/(\d+)/
      $1.to_i
    end

    # Возвращает десериализованное (при необходимости) значение свойства
    #
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
  end
end
