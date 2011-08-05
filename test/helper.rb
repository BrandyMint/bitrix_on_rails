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

require 'ruby-debug'
require 'active_record'
require 'factory_girl'
require 'shoulda'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => ":memory:"
  )
require 'schema'


# require 'test/unit'
# require "test/unit/notify"
# require "test/unit/rr"

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
# $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app','models'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'bitrix_on_rails'

# Модели
#
Dir.glob('./app/models/*.rb').each { |file| require file }

require 'factories'

class Test::Unit::TestCase
  include Factory::Syntax::Methods

  def bitrix_configure
    BitrixOnRails.configure do
      infoblock 3, IblockElement3
      infoblock 7, IblockElement7
    end
  end

end
