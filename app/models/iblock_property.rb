# -*- coding: utf-8 -*-
class IblockProperty < ActiveRecord::Base
  set_table_name :b_iblock_property

  belongs_to :iblock

  # TODO Что это за link_iblock?
  belongs_to :link_iblock, :class_name=>'Iblock'

  has_many :iblock_property_enums, :foreign_key=>:property_id
  has_many :iblock_element_properties

  cattr_accessor :cache

  class << self
    def find(id)
      cache_all unless @@cache
      @@cache[id] or raise "Не найдено такое свойство iblock_property #{id}"
    end

    # Запускается в ./lib/bitrix_on_rails при загрузке
    def cache_all
      @@cache = IblockProperty.all.inject({}) { |hash, prop| hash[prop.id]=prop; hash }
    end
  end

  def code
    val = read_attribute('code')
    return nil if val.nil?
    val.downcase.to_sym
  end
end
