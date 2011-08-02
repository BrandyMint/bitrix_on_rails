# -*- coding: utf-8 -*-
class IblockPropertyEnum < ActiveRecord::Base
  set_table_name :b_iblock_property_enum

  belongs_to :iblock_property, :foreign_key=>:property_id
end
