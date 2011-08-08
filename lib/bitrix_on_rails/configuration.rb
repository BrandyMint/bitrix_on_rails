module BitrixOnRails
  class Configuration
    attr_reader :infoblocks

    def initialize
      @infoblocks = []
    end

    # Создание необходимой инфраструктуры для работы с инфоблоком, id которого равен iblock_id.
    # Пользователь может задать следующие параметры через options:
    #
    # * :class_name - имя класса для создаваемого наследника от IblockElement. Если пользователь не задал
    #   эту опцию, а также не задал :extended_class, то новый класс будет называется IblockElement3, где 3 -
    #   iblock_id.
    # * :extended_class - класс, который необходимо расширить (предполагается, что он наследуется от IblockElement).
    #   Эта опция имеет преимущество перед :class_name.
    # * :extended_by - модуль, который будет включен в создаваемый класс.
    #
    def infoblock(iblock_id, options = {})
      @infoblocks << {
        :iblock_id  => iblock_id,
        :options    => options
      }
    end
  end
end
