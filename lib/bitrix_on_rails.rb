# -*- coding: utf-8 -*-
module BitrixOnRails
  def self.init
    Iblock.all.map &:init_property_models
  end
end

require 'bitrix_on_rails/engine'
require 'bitrix_on_rails/active_record'
require 'bitrix_on_rails/iblock_element_prop_s'
require 'bitrix_on_rails/iblock_element_prop_m'

ActiveRecord::Base.extend BitrixOnRails::ActiveRecord
