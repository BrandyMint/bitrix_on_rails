# -*- coding: utf-8 -*-

require 'helper'

class TestBitrixOnRails < Test::Unit::TestCase
  def tests
    assert_respond_to BitrixOnRails, :configure
  end
end
