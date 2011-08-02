# -*- coding: utf-8 -*-
module BitrixOnRails
  def self.init
    # Это здесь для того чтобы при перезагрузке в development
    # режиме заново создавались ассоциации iblock_element_prop_s3
    # TODO переделать на более элегантное решение
    Iblock.all.map(&:init_property_models).count
    # IblockProperty.cache_all
  end
end

require 'rails'
require 'active_record'

require 'bitrix_on_rails/engine'
require 'bitrix_on_rails/active_record'
require 'bitrix_on_rails/iblock_element_prop_s'
require 'bitrix_on_rails/iblock_element_prop_m'

ActiveRecord::Base.extend BitrixOnRails::ActiveRecord
