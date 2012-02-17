class IblockElementProperty < ActiveRecord::Base
  self.table_name = :b_iblock_element_property

  belongs_to :iblock_property
  belongs_to :iblock_element
end
