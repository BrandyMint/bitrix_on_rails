require 'helper'

class ActiveRecordTest < Test::Unit::TestCase
  context 'has_infoblock' do
    setup do
      BitrixOnRails.define_iblock_class 3

      class Post < ActiveRecord::Base
        has_infoblock 3, :property_13
      end
    end

    should 'create associations' do
      assert Post.reflections.include?(:iblock_element_prop_s3)
      assert Post.reflections.include?(:iblock_element)
    end

    should 'delegate property methods to iblock_element' do
      post = Post.new
      assert_respond_to post, :status
    end
  end
end
