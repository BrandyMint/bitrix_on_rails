# -*- coding: utf-8 -*-
# Factory.sequence :name do |n|
#   “name#{n}”
# end

FactoryGirl.define do
  factory :iblock_type

  factory :iblock do
    version 2
    timestamp_x Time.now
    name 'имя инфоблока'
    lid 'lid'
    association :iblock_type
  end


  factory :iblock_element do
    association :iblock
  end


  #
  # Инфоблок 3
  #

  factory :iblock3, :parent=>:iblock do
    id 3
  end

  factory :iblock_element3, :parent => :iblock_element do
    association :iblock, :factory=>:iblock3
  end

  factory :iblock_element_prop_s3 do
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

# iblock_type =
# Iblock.new do |i|
#   i.id = 3
#   i.version = 2
#   i.name = 'Свойство блога'
#   i.timestamp_x = Time.now
#   i.iblock_type = IblockType.create
#   i.lid = 'lid'
#   i.save
# end

# Iblock.new do |i|
#   i.id = 7
#   i.version = 2
#   i.name = 'Эмитенты'
#   i.timestamp_x = Time.now
#   i.iblock_type = IblockType.create
#   i.lid = 'lid'
#   i.save
# end
