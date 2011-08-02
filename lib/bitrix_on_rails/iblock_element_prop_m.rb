# -*- coding: utf-8 -*-
# -*- coding: utf-8 -*-
module BitrixOnRails::IblockElementPropM
  def acts_as_iblock_element_prop_m(id)
    extend ClassMethods
    include InstanceMethods

    # Убираем лишнюю s вконце
    #set_table_name 'b_'+table_name.chop
    set_table_name "b_iblock_element_prop_m#{id}"

    # delegate :code, :to=>:property

    belongs_to :iblock_element
    belongs_to :iblock_property
  end

  module ClassMethods
    def init
      self.to_s=~/(\d+)/
      iblock_id = $1.to_i
      IblockElement.send :has_many, "iblock_element_prop_m#{iblock_id}".to_sym, :class_name=>"::IblockElementPropM#{iblock_id}"
    end
  end

  module InstanceMethods

    def property
      # Достаем кешированный вариант
      IblockProperty.find(iblock_property_id)
    end

    def code
      @code||=property.code
    end

    def get_value
      case property.property_type
      when 'S'     # String
        self.value
      when 'N'     # Numeric
        self.value_num.to_i  # Когда BigDecimal - не приятно
        # when 'E'     # Enum?
        # self.value_enum
        # when 'L'     # WTF?
      else
        raise "Не установленный тип (#{iblock_property.property_type}) свойства (#{self.class} #{id})"
      end
    end
  end
end


# Table b_iblock_element_prop_m7
# ==============================
# ID, IBLOCK_ELEMENT_ID, IBLOCK_PROPERTY_ID, VALUE, VALUE_ENUM, VALUE_NUM, DESCRIPTION
# ------------------------------
# ID               int(11) PK
# IBLOCK_ELEMENT_ID int(11)
# IBLOCK_PROPERTY_ID int(11)
# VALUE            text
# VALUE_ENUM       int(11)
# VALUE_NUM        decimal(18,4)
# DESCRIPTION      varchar(255)
