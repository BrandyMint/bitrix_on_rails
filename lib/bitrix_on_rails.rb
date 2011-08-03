# -*- coding: utf-8 -*-
require 'rails'
require 'active_record'

module BitrixOnRails
  def self.init
    # При работе с тестовой базой может случиться ситуация, что база пуста и никакой таблицы b_iblock
    # там нет, что приведет к ислючению. Проверка сделана для корректной работы Rake задач.
    if ::ActiveRecord::Base.connection.tables.find{ |t| t == 'b_iblock'}
      Iblock.all.map &:init_property_models
    end
  end
end

require 'bitrix_on_rails/engine'
require 'bitrix_on_rails/active_record'
require 'bitrix_on_rails/iblock_element_prop_s'
require 'bitrix_on_rails/iblock_element_prop_m'

ActiveRecord::Base.extend BitrixOnRails::ActiveRecord
