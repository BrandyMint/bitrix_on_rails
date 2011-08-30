# -*- coding: utf-8 -*-
module PHP
  # Когда битрикс работает с базой в cp1251, а рельсы с UTF-8
  # Возникают проблемы с подсчетом длинны строк при сериализации
  # 'тест' в cp1251 имеет 4 символа, а в utf-8 - 8.
  #
  # Поэтому приходится производить все сериализацию через эти врапперы.
  #

  def PHP.encode_in_deep(val, encoding)
    if val.is_a? Array
      val = val.map { |v| encode_in_deep(v, encoding) }
    elsif val.is_a? Hash
      val.each_pair do |k,v|
        val[k] = encode_in_deep(v, encoding)
      end
    elsif val.is_a? String
      val = val.encode(encoding)
    end
    val
  end

  def PHP.serialize_encoded(val)
    val = encode_in_deep(val, 'CP1251')
    serialize(val).encode('UTF-8')
  end

  def PHP.unserialize_encoded(s)
    val = unserialize(s.encode('CP1251'))
    val = encode_in_deep(val, 'UTF-8')
    val
  end
end
