# -*- coding: utf-8 -*-
module BitrixOnRails::IblockElementPropM
  def acts_as_iblock_element_prop_m(id)
    extend ClassMethods
    include InstanceMethods

    self.table_name = "b_iblock_element_prop_m#{id}"

    belongs_to :iblock_element
    belongs_to :iblock_property
  end

  module ClassMethods
  end

  module InstanceMethods
    def property
      # Достаем кешированный вариант
      IblockProperty.find(iblock_property_id)
    end

    def code
      @code ||= property.code
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
