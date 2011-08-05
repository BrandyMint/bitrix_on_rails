# -*- coding: utf-8 -*-
require 'rails'
require 'active_record'

module BitrixOnRails
  def self.configure
    return unless ::ActiveRecord::Base.connection.tables.include? 'b_iblock'

    config = Configuration.new
    yield config

    config.infoblocks.each { |infoblock|
      Iblock.all.map &:init_property_models
      IblockElement.define_iblock_class(infoblock[:iblock_id], infoblock[:class_name], infoblock[:options])
    }
  end
end

require 'bitrix_on_rails/engine'
require 'bitrix_on_rails/configuration'
require 'bitrix_on_rails/active_record'
require 'bitrix_on_rails/iblock_element_prop_s'
require 'bitrix_on_rails/iblock_element_prop_m'

ActiveRecord::Base.extend BitrixOnRails::ActiveRecord
