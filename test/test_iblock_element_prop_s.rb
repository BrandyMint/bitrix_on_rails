# encoding: UTF-8
require 'helper'

class IblockElementPropSTest < Test::Unit::TestCase
   PROP_S_VALUES = [
     11286, nil, # post_id
     'a:2:{s:4:"TEXT";s:22:"Полемика по повышению.";s:4:"TYPE";s:4:"html";}', nil, #preview_mpage
     nil, nil # glob_class
   ]

  def create_iblock(iblock_factory, iblock_element_factory, prop_s_values = [], prop_m_values = [])
    iblock = Factory.create(iblock_factory)

    BitrixOnRails.define_iblock_class(iblock.id)

    @s_prop_class = Object.const_get("IblockElementPropS#{iblock.id}")
    @m_prop_class = Object.const_get("IblockElementPropM#{iblock.id}")

    properties = @s_prop_class.columns.collect { |c| c.name }

    @iblock_element = Factory.create(iblock_element_factory, :iblock => iblock)

    prop_m_values.each { |v|
      @m_prop_class.create(:iblock_element_id => @iblock_element.id, :iblock_property_id => iblock.iblock_properties.last.id, :value => v)
    }

    prop_s_values = [@iblock_element.id] + prop_s_values
    @iblock_element_prop_s = @s_prop_class.create(properties.inject({}){ |a,e| a[e] = prop_s_values[properties.find_index(e)]; a})
  end

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
      create_iblock :iblock3, :iblock_element3, PROP_S_VALUES, [144, 1394860, 35, 6, 165]
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
      create_iblock :iblock3, :iblock_element3, PROP_S_VALUES, [10]
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

  context 'serialize' do
    setup do
      create_iblock :iblock3, :iblock_element3, PROP_S_VALUES
    end

    should 'convert value into serialized hash if user_type is HTML' do
      @iblock_element_prop_s.preview_mpage = 'BitrixOnRails is awesome, bro!'
      assert_equal 'a:2:{s:4:"TEXT";s:30:"BitrixOnRails is awesome, bro!";s:4:"TYPE";s:4:"html";}',
                   @iblock_element_prop_s.send("property_#{@s_prop_class.s_props[:preview_mpage][:id]}")
    end
  end
end
