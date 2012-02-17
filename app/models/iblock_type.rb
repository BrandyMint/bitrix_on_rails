class IblockType < ActiveRecord::Base
  self.table_name = :b_iblock_type

  has_many :blocks, :class_name=>"Iblock"
end
