# -*- coding: utf-8 -*-
class IblockSection < ActiveRecord::Base
  class << self
    @iblock_id = nil

    def iblock_id
      @iblock_id
    end
  end

  self.table_name = :b_iblock_section

  belongs_to :iblock

  default_scope order(:sort)

  has_many :direct_iblock_elements, :class_name=>'IblockElement'

  has_many :iblock_section_elements
  has_many :iblock_elements, :through => :iblock_section_elements

  def self.set_iblock_id(id)
    @iblock_id = id
    default_scope where(:iblock_id => id, :active => 'Y')
  end

  def to_s
    name
  end
end
