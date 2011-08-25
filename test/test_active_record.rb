require 'helper'

class ActiveRecordTest < Test::Unit::TestCase
  context 'has_infoblock' do
    setup do
      @iblock = Factory.create(:iblock3)
      BitrixOnRails.define_iblock_class @iblock.id

      id = @iblock.id

      class Post < ActiveRecord::Base
      end

      Post.instance_eval do
        has_infoblock id, :property_13
      end
    end

    teardown do
      Object.send :remove_const, "IblockElement#{@iblock.id}"
    end

    should 'create associations' do
      assert Post.reflections.include?("iblock_element_prop_s#{@iblock.id}".to_sym)
      assert Post.reflections.include?(:iblock_element)
      assert Object.const_get("IblockElementPropS#{@iblock.id}").reflections.include?(:post)
    end

    should 'delegate property methods to iblock_element' do
      post = Post.new
      [:preview_mpage, :glob_class, :preview_mpage=].each { |m|
        assert_respond_to post, m
      }
    end

    should 'not delegete multiple property assignment methods to iblock_element' do
      assert_not_respond_to Post, :glob_class=
    end
  end
end
