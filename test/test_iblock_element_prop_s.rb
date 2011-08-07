# encoding: UTF-8
require 'helper'

class IblockElementPropSTest < Test::Unit::TestCase
  context 'acts_as_iblock_prop_s' do
    setup do
      @iblock = Factory.create(:iblock3)

      BitrixOnRails.define_iblock_class(@iblock.id)

      @s_prop_class = Object.const_get("IblockElementPropS#{@iblock.id}")
    end

    should 'set table name to b_iblock_element_prop_s#{id}' do
      assert_equal "b_iblock_element_prop_s#{@iblock.id}", @s_prop_class.table_name
    end

    should 'set association with iblock_element' do
      assert @s_prop_class.reflections.include?(:iblock_element)
      assert_equal BitrixOnRails.infoblocks[@iblock.id].name, @s_prop_class.reflections[:iblock_element].class_name
    end

    should 'define access methods for single properties' do
      [:post_id, :post_id=, :find_by_post_id].each { |m|
        assert @s_prop_class.instance_methods.include?(m)
      }

      [:preview_mpage, :preview_mpage=, :find_by_preview_mpage].each { |m|
        assert @s_prop_class.instance_methods.include?(m)
      }
    end
  end

  context 'instance methods' do
    setup do
      iblock = Factory.create(:iblock3)
      BitrixOnRails.define_iblock_class(iblock.id)
      s_prop_class = Object.const_get("IblockElementPropS#{iblock.id}")
      m_prop_class = Object.const_get("IblockElementPropM#{iblock.id}")

      properties = s_prop_class.columns.collect { |c| c.name }

      @iblock_element = Factory.create(:iblock_element3, :iblock => iblock)

      values = [
        @iblock_element.id,
        11286, nil, # post_id
        'a:2:{s:4:"TEXT";s:22:"Полемика по повышению.";s:4:"TYPE";s:4:"html";}', nil, #preview_mpage
        nil, nil # glob_class
      ]

      [144, 1394860, 35, 6, 165].each { |i|
        m_prop_class.create(
          :iblock_element_id => @iblock_element.id,
          :iblock_property_id => iblock.iblock_properties.last.id,
          :value => i
        )
      }

      @iblock_element_prop_s = s_prop_class.create(properties.inject({}){ |a,e| a[e] = values[properties.find_index(e)]; a})
    end

    should 'return unserialized values' do
      assert_equal 11286, @iblock_element_prop_s.post_id
      assert_equal 'Полемика по повышению.', @iblock_element_prop_s.preview_mpage
    end

    should 'return instance of MPropValuesWrapper for multiple property' do
      assert @iblock_element_prop_s.glob_class.is_a?(BitrixOnRails::IblockElementPropS::MPropValuesWrapper)
    end
  end

  context 'MPropValuesWrapper' do
    setup do
      iblock = Factory.create(:iblock3)
      BitrixOnRails.define_iblock_class(iblock.id)
      s_prop_class = Object.const_get("IblockElementPropS#{iblock.id}")
      @m_prop_class = Object.const_get("IblockElementPropM#{iblock.id}")

      properties = s_prop_class.columns.collect { |c| c.name }

      iblock_element = Factory.create(:iblock_element3, :iblock => iblock)
      values = [
        iblock_element.id,
        11286, nil, # post_id
        'a:2:{s:4:"TEXT";s:22:"Полемика по повышению.";s:4:"TYPE";s:4:"html";}', nil, #preview_mpage
        nil, nil # glob_class
      ]

      @m_prop_class.create(:iblock_element_id => iblock_element.id, :iblock_property_id => iblock.iblock_properties.last.id, :value => 10)

      @iblock_element_prop_s = s_prop_class.create(properties.inject({}){ |a,e| a[e] = values[properties.find_index(e)]; a})
    end

    should 'add new record to b_iblock_element_prop_m on add' do
      assert_difference("#{@iblock_element_prop_s.m_prop_class}.count") do
        @iblock_element_prop_s.glob_class.add(16)
      end
    end

    should 'delete record on destroy' do
      assert_difference("#{@iblock_element_prop_s.m_prop_class}.count", -1) do
        @iblock_element_prop_s.glob_class.remove(10)
      end
    end
  end
end
