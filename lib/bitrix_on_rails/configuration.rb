module BitrixOnRails
  class Configuration
    attr_reader :infoblocks

    def initialize
      @infoblocks = []
    end

    def infoblock(iblock_id, options = {})
      @infoblocks << {
        :iblock_id  => iblock_id,
        :options    => options
      }
    end
  end
end
