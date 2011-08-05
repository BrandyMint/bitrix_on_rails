module BitrixOnRails
  class Configuration
    attr_reader :infoblocks

    def initialize
      @infoblocks = []
    end

    def infoblock(iblock_id, class_name = nil, options = {})
      @infoblocks << {
        :iblock_id  => iblock_id,
        :class_name => class_name,
        :options    => options
      }
    end
  end
end
