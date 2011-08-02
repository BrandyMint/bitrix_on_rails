# -*- coding: utf-8 -*-
class IblockGroup < ActiveRecord::Base
  set_table_name :b_iblock_group

  belongs_to :iblock
end
