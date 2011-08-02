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

  after_find :initialize_properties

  attr_accessor :properties

  def to_s
    name
  end

  def s_props
    # has_one
    @s_props ||= Iblock.s_props_class(iblock_id).find_by_iblock_element_id( id )
  end

  def iblock_element_prop_m
    Iblock.m_props_class(iblock_id).where(:iblock_element_id=>id)
  end

  def m_props
    # TODO Cache
    @m_props={}
    iblock_element_prop_m.each do |p|
      @m_props[p.code]||=[]
      @m_props[p.code] << p.get_value
    end
    @m_props
  end

  # Если мы спрашиваем iblock_element.post
  # то он ищет ключ :post_id в свойствах элемента
  # и если находит, то возвращает Post.find_by_id(properties[:post_id])
  #
  def method_missing(method, *args)
    id_name = "#{method}_id".to_sym
    if properties and properties.include?(id_name)
      # TODO Проверять на наличие такого класса и то что он ActiveRecord
      # Кешировать
      method.to_s.capitalize.constantize.find_by_id(properties[id_name])
    else
      super
    end
  end

  def self.set_iblock_id(id)
    @iblock_id = id
    @iblock_properties = IblockProperty.where(:iblock_id => id).inject({}){ |a,e| a[e.code] = e.id; a }

    prop_s_class = "::IblockElementPropS#{id}"
    prop_m_class = "::IblockElementPropM#{id}"

    has_one :property_set, :class_name => prop_s_class, :foreign_key => 'iblock_element_id', :autosave => true
    has_many :m_prop_values, :class_name => prop_m_class, :foreign_key => 'iblock_element_id'

    default_scope where(:iblock_id => id, :active => 'Y')
  end

  private

  def initialize_properties
    # TODO Могу повторяться именя в m_props, ругаться чтоли
    @properties = (s_props ? s_props.properties : {}).merge m_props

    # TODO Переписать на автоматическое определение названия свойства в моделях property_set и m_prop_values
    # чтобы уйти от хеша @properties (оставить его массивом для дебаггинга)

    # TODO Сделать в элементе автоделегейт
    @properties.keys.each do |prop|
      # TODO Перенести на прямой вызов объектов s_props/m_props
      instance_eval "def #{prop}; @properties[:#{prop}]; end"
      instance_eval "def #{prop}=(val); @properties[:#{prop}]=property_set.#{prop}=val; end"
    end
  end

end
