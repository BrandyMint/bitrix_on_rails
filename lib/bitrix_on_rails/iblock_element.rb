module BitrixOnRails

  # Хранит список созданных классов в виде хеша: iblock_id -> class_name
  @@infoblocks = {}

  def self.infoblocks
    @@infoblocks
  end

  def self.define_iblock_class(iblock_id, options = {})
    # Определяем имя класса, который нужно создать, а также namespace, в котором
    # его нужно создать.
    if class_name = options[:class_name]
      a = class_name.split('::')

      class_name = a.last

      namespace = a[0..-2].join('::')
      namespace = namespace.empty? ? Kernel : Kernel.const_get(namespace)
    else
      class_name = "IblockElement#{iblock_id}"
      namespace  = Kernel
    end

    create_prop_classes(iblock_id)

    iblock_element_class = create_inherited_class(iblock_id, options[:extended_by])
    namespace.const_set(class_name, iblock_element_class)

    # Вставляем связи с i_block_element_prop_* на уровень IblockElement. Это может быть полезно
    # в том случае, если пользователь получил объект класса IblockElement, а не создаваемого.
    # Использование этих связей полностью в компетенции пользователя объекта.
    IblockElement.instance_eval do
      has_one  "iblock_element_prop_s#{iblock_id}".to_sym
      has_many "iblock_element_prop_m#{iblock_id}".to_sym
    end
  end

  protected

  def self.create_inherited_class(iblock_id, extended_by = nil)
    iblock_element_class = Class.new(::IblockElement) do
      @iblock_id = iblock_id
      @iblock_properties = Iblock.get_property_codes(iblock_id).inject([]){ |a,e| a << e[0]}

      has_one :property_set, :class_name => "IblockElementPropS#{iblock_id}", :foreign_key => 'iblock_element_id', :autosave => true

      default_scope where(:iblock_id => iblock_id)

      @iblock_properties.each { |m|
        delegate m, :to => :property_set
      }
    end

    iblock_element_class.extend Kernel.const_get(extended_by) if extended_by

    @@infoblocks[iblock_id] = iblock_element_class

    iblock_element_class
  end

  def self.create_prop_classes(iblock_id)
    const_name = "IblockElementPropS#{iblock_id}"
    unless Kernel.const_defined? const_name
      c = Class.new(::ActiveRecord::Base) do
        extend BitrixOnRails::IblockElementPropS
        acts_as_iblock_element_prop_s(iblock_id)
      end
      Kernel.const_set const_name, c
    end
    # Kernel.const_get(const_name).init

    const_name = "IblockElementPropM#{iblock_id}"
    unless Kernel.const_defined? const_name
      c = Class.new(::ActiveRecord::Base) do
        extend BitrixOnRails::IblockElementPropM
        acts_as_iblock_element_prop_m(iblock_id)
      end
      Kernel.const_set "IblockElementPropM#{iblock_id}", c
    end
    # Kernel.const_get(const_name).init
  end
end
