require 'helper'

class IblockElementTest < Test::Unit::TestCase

  context 'define_iblock_class' do

    context 'with class_name set to nil' do
      setup do
        IblockElement.define_iblock_class(3)
      end

      should 'create class IblockElement3 in global namespace' do
        assert_not_nil Kernel.const_defined?('IblockElement3')
      end
    end

    context 'with class name in global namespace' do
      setup do
        IblockElement.define_iblock_class(3, :class_name => 'PostProperties')
      end

      should 'create class PostProperties in global namespace' do
        assert_not_nil Kernel.const_defined?('PostProperties')
      end
    end

    context 'with class name in non global namespace' do
      setup do
        Kernel.const_set('Post', Class.new)
        IblockElement.define_iblock_class(3, :class_name => 'Post::Element')
      end

      should 'create class Element in Post namespace' do
        assert_not_nil Post.const_defined?('Element')
      end
    end

    context 'behaviour' do
      setup do
        IblockElement.define_iblock_class(3)
      end

      should 'create property classes' do
        assert_not_nil Kernel.const_defined?('IblockElementPropS3')
        assert_not_nil Kernel.const_defined?('IblockElementPropM3')
      end

      should 'create associations for property classes in IblockElement' do
        assert_not_nil IblockElement.reflections[:iblock_element_prop_s3]
        assert_not_nil IblockElement.reflections[:iblock_element_prop_m3]
      end
    end

    context 'with passed :extended_by' do
      setup do
        Kernel.const_set('IblockElementExtension', Module.new{ def some_method ; end})
        IblockElement.define_iblock_class(3, :extended_by => 'IblockElementExtension')
      end

      should 'extend created class with given module' do
        # Не нашел другого способа проверить, что модуль был включен в класс
        assert IblockElement3.methods.include?(:some_method)
      end
    end

  end

end
