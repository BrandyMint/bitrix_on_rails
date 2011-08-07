# -*- coding: utf-8 -*-

FactoryGirl.define do
  factory :iblock_type

  factory :iblock do
    version 2
    timestamp_x Time.now
    name 'имя инфоблока'
    lid 'lid'
    association :iblock_type
  end

  factory :iblock_property do
    timestamp_x Time.now
  end

  factory :iblock_element do
  end

  #
  # Инфоблок 3
  #

  factory :iblock3, :parent=>:iblock do
    name 'Свойства поста'

    after_build { |iblock|
      iblock.iblock_properties.build  Factory.build(:iblock3_s_prop_post_id).attributes
      iblock.iblock_properties.build  Factory.build(:iblock3_s_prop_preview_mpage).attributes
      iblock.iblock_properties.build  Factory.build(:iblock3_m_prop_glob_clas).attributes
    }

    after_create { |iblock|
      connection = ActiveRecord::Base.connection
      connection.create_table "b_iblock_element_prop_s#{iblock.id}".to_sym, :id => false do |t|
        t.integer :iblock_element_id
        iblock.iblock_properties.each { |property|
          type = case property.property_type
                 when 'N' then :integer
                 when 'S' then :string
                 when 'L' then :integer
                 end

          t.send type, "property_#{property.id}".to_sym
          t.string "description_#{property.id}"
        }
      end

      connection.create_table "b_iblock_element_prop_m#{iblock.id}".to_sym do |t|
        t.integer :iblock_element_id
        t.integer :iblock_property_id
        t.integer :value
        t.string :description
      end
    }
  end

  factory :iblock3_s_prop_post_id, :parent => :iblock_property do
    name 'ID поста'
    code 'POST_ID'
    property_type 'N'
    multiple 'N'
  end

  factory :iblock3_s_prop_preview_mpage, :parent => :iblock_property do
    name 'Анонс для главной'
    code 'PREVIEW_MPAGE'
    property_type 'S'
    multiple 'N'
  end

  factory :iblock3_m_prop_glob_clas, :parent => :iblock_property do
    name 'Глобальный классификатор'
    code 'GLOB_CLASS'
    property_type 'S'
    multiple 'Y'
  end

  factory :iblock_element3, :parent => :iblock_element do
    name ''
  end

  #
  # Инфоблок 7
  #

  factory :iblock7, :parent=>:iblock do
    id 7
  end

  factory :iblock_element7, :parent => :iblock_element do
    association :iblock, :factory=>:iblock7
  end
end
