# -*- coding: utf-8 -*-
require 'rails'
require 'active_record'

module BitrixOnRails
  def self.configure
    config = Configuration.new
    yield config

    if ::ActiveRecord::Base.connection.tables.include? 'b_iblock'
      Iblock.all.map &:init_property_models

      if config
        config.infoblocks.each { |infoblock|
          # IblockElement.define_iblock_class(infoblock[:iblock_id], infoblock[:class_name], infoblock[:options])
        }
      end
    end
  end

  class Configuration
    attr_reader :infoblocks

    def initialize
      @infoblocks = []
    end

    def infoblock(iblock_id, class_name = nil, options = {})
      @infoblocks << {
        :iblock_id  => iblock_id,
        :class_name => class_name,
        :options    => options
      }
    end
  end
end

require 'bitrix_on_rails/engine'
require 'bitrix_on_rails/active_record'
require 'bitrix_on_rails/iblock_element_prop_s'
require 'bitrix_on_rails/iblock_element_prop_m'

ActiveRecord::Base.extend BitrixOnRails::ActiveRecord
