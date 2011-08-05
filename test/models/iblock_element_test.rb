require 'helper'

class IblockElementTest < Test::Unit::TestCase

  context 'define_iblock_class' do

    context 'with class_name set to nil' do
      setup do
        IblockElement.define_iblock_class(3)
      end

      should 'create class IblockElement3 in global namespace' do
        assert_not_nil Kernel.const_get('IblockElement3')
      end
    end

    context 'with class name in global namespace' do
      setup do
        IblockElement.define_iblock_class(3, 'PostProperties')
      end

      should 'create class PostProperties in global namespace' do
        assert_not_nil Kernel.const_get('PostProperties')
      end
    end

    context 'with class name in non global namespace' do
      setup do
        class Post ; end
        IblockElement.define_iblock_class(3, 'Post::Element')
      end

      should 'create class Element in Post namespace' do
        assert_not_nil Post.const_get('Element')
      end
    end

  end

end
