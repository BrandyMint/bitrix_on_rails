# -*- coding: utf-8 -*-
class IblockField < ActiveRecord::Base
  self.table_name = :b_iblock_fields

  belongs_to :iblock
end
