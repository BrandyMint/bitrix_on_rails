# -*- coding: utf-8 -*-
# require 'rails'

module BitrixOnRails
end

require 'active_record'

require 'bitrix_on_rails/active_record'
require 'bitrix_on_rails/iblock_element_prop_s'
require 'bitrix_on_rails/iblock_element_prop_m'
# require 'bitrix_on_rails/engine'

# ActiveRecord::Base.connection.tables

ActiveRecord::Base.extend BitrixOnRails::ActiveRecord

# Просто подгружаем модель, тогда в ней появятся ассоциации типа iblock_element_prop_s3
IblockElement.class

# IblockProperty.cache_all
