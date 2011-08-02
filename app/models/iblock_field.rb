# -*- coding: utf-8 -*-
class IblockField < ActiveRecord::Base
  set_table_name :b_iblock_fields

  belongs_to :iblock
end
