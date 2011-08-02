# -*- coding: utf-8 -*-
require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
# require 'test/unit'
# require "test/unit/notify"
# require "test/unit/rr"

require 'shoulda'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
# $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app','models'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'bitrix_on_rails'

# Модели
#
Dir.glob('./app/models/*.rb').each { |file| require file }
# require 'iblock'
# require 'iblock_type'


ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => ":memory:"
)

require 'schema'

Iblock.create(
  :id=>3,
  :name=>'Свойство блога',
  :timestamp_x=>Time.now,
  :iblock_type=>IblockType.create,
  :lid=>'lid')

Iblock.create(
  :id=>7,
  :name=>'Эмитенты',
  :timestamp_x=>Time.now,
  :iblock_type=>IblockType.create,
  :lid=>'lid')


class Test::Unit::TestCase
end
