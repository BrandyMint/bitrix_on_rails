# -*- coding: utf-8 -*-
class IblockSectionElement < ActiveRecord::Base
  self.table_name = :b_iblock_section_element

  belongs_to :iblock_section
  belongs_to :iblock_element
  belongs_to :additional_property, :class_name=>'IblockProperty'
end
