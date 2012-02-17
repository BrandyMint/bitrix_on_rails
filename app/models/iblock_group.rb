# -*- coding: utf-8 -*-
class IblockGroup < ActiveRecord::Base
  self.table_name = :b_iblock_group

  belongs_to :iblock
end
