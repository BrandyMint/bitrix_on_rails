module BitrixOnRails

  # Хранит список созданных классов в виде хеша: iblock_id -> class_name
  @@infoblocks = {}

  def self.infoblocks
    @@infoblocks
  end

  def self.define_iblock_class(iblock_id, options = {})
    iblock_element_class = create_iblock_class(iblock_id, options[:extended_class], options[:extended_by])

    unless options[:extended_class]
      # Определяем имя класса, который нужно создать, а также namespace, в котором
      # его нужно создать.
      if class_name = options[:class_name]
        a = class_name.split('::')

        class_name = a.last

        namespace = a[0..-2].join('::')
        namespace = namespace.empty? ? Object : Object.const_get(namespace)
      else
        class_name = "IblockElement#{iblock_id}"
        namespace  = Object
      end

      namespace.const_set(class_name, iblock_element_class)
    end

    create_prop_classes(iblock_id, iblock_element_class)
  end

  protected

  def self.create_iblock_class(iblock_id, extended_class = nil, extended_by = nil)
    iblock_element_class = extended_class || Class.new(::IblockElement) {}

    iblock_element_class.instance_eval do
      @iblock_id = iblock_id
      @iblock_properties = Iblock.get_properties(iblock_id).inject({}){ |a,e| a[e[1].code] = {:id => e[1].id, :multiple => e[1].multiple == 'Y'}; a}

      has_one :property_set, :class_name => "IblockElementPropS#{iblock_id}", :foreign_key => 'iblock_element_id', :autosave => true
      has_many :m_props, :class_name => "IblockElementPropM#{iblock_id}", :foreign_key => 'iblock_element_id', :readonly => true

      default_scope where(:iblock_id => iblock_id)

      @iblock_properties.each { |m, property|
        delegate m, :to => :property_set
        delegate "#{m}=", :to => :property_set unless property[:multiple]
      }
    end

    iblock_element_class.extend Object.const_get(extended_by) if extended_by

    @@infoblocks[iblock_id] = iblock_element_class

    iblock_element_class
  end

  def self.create_prop_classes(iblock_id, iblock_element_class)
    const_name = "IblockElementPropS#{iblock_id}"
    unless Object.const_defined? const_name
      c = Class.new(::ActiveRecord::Base) do
        extend BitrixOnRails::IblockElementPropS

        class << self
          # Имя класса, хранящего значения для множественных свойств
          @m_prop_class = nil

          # Список множественных свойств
          @m_props = nil

          # Список одиночных свойств
          @s_props = nil

          def m_prop_class
            Object.const_get(@m_prop_class)
          end

          def m_props
            @m_props
          end

          def s_props
            @s_props
          end
        end

        acts_as_iblock_element_prop_s(iblock_id, iblock_element_class)
      end
      Object.const_set const_name, c
    end

    const_name = "IblockElementPropM#{iblock_id}"
    unless Object.const_defined? const_name
      c = Class.new(::ActiveRecord::Base) do
        extend BitrixOnRails::IblockElementPropM
        acts_as_iblock_element_prop_m(iblock_id)
      end
      Object.const_set "IblockElementPropM#{iblock_id}", c
    end

    # Вставляем связи с i_block_element_prop_* на уровень IblockElement. Это может быть полезно
    # в том случае, если пользователь получил объект класса IblockElement, а не создаваемого.
    # Использование этих связей полностью в компетенции пользователя объекта.
    IblockElement.instance_eval do
      has_one  "iblock_element_prop_s#{iblock_id}".to_sym
      has_many "iblock_element_prop_m#{iblock_id}".to_sym
    end
  end
end
