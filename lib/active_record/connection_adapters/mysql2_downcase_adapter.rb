# -*- coding: utf-8 -*-
# Just use 'mysql2_downcase' adapter in database.yml
#

require 'active_record/connection_adapters/mysql2_adapter'

module ActiveRecord
  class Base
    # Establishes a connection to the database that's used by all Active Record objects.
    def self.mysql2_downcase_connection(config)
      config[:username] = 'root' if config[:username].nil?

      if Mysql2::Client.const_defined? :FOUND_ROWS
        config[:flags] = Mysql2::Client::FOUND_ROWS
      end

      client = Mysql2::Client.new(config.symbolize_keys)
      options = [config[:host], config[:username], config[:password], config[:database], config[:port], config[:socket], 0]
      ConnectionAdapters::Mysql2DowncaseAdapter.new(client, logger, options, config)
      # ActiveRecord::Base.mysql2_connection(config)
    end
  end

  class Result

    # Это выполняется через ActiveRecord::Result.new в mysql2_adapter
    # при выполнении запроса
    def initialize(columns, rows)
      @columns   = columns.map { |c| c.downcase }
      @rows      = rows
      @hash_rows = nil
    end
  end

  module ConnectionAdapters
    class Column

      alias_method :old_initialize, :initialize

      # Это выполняется при выборке списка аттрибутов на уровне класса
      #
      def initialize(name, default, sql_type = nil, null = true)
        old_initialize name.downcase, default, sql_type, null
      end

    end

    class Mysql2DowncaseAdapter < Mysql2Adapter

      ADAPTER_NAME = 'Mysql2Downcase'

      # Надо бы глобально сделать тут:
      # def execute(sql, name = nil)
      #   debugger
      # end

      # Это чтобы нормально определся primary_key
      def pk_and_sequence_for(table)
        keys = []
        result = execute("DESCRIBE #{quote_table_name(table)}", 'SCHEMA')
        result.each(:symbolize_keys => true, :as => :hash) do |row|
          keys << row[:Field].downcase if row[:Key] == "PRI"
        end
        keys.length == 1 ? [keys.first, nil] : nil
      end

    end
  end
end


# Возможно понадобится исправить этот метод
# quote_column_name

# Хороший пример адаптера - http://virtuoso.rubyforge.org/activerecord-mysql2spatial-adapter/
# https://github.com/dazuma/activerecord-mysql2spatial-adapter
