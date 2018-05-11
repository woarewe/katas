class RomanNumerals

  def self.to_roman(number)
    result = ''
    coder.each do |key, value|
      result << value * (number / key)
      number %= key
    end
    result
  end

  def self.from_roman(str)
    letters = str.split(//)
    letters.each_with_index.inject(0) do |value, pair|
      value + decoder[pair.first] * (compare_letters(pair.first, letters[pair.last + 1]) ? 1 : -1)
    end
  end

  private

  def self.compare_letters(first, second)
    return true unless second
    decoder[first] >= decoder[second]
  end

  def self.decoder
    {
      'I' => 1,
      'V' => 5,
      'X' => 10,
      'L' => 50,
      'C' => 100,
      'D' => 500,
      'M' => 1000
    }
  end

  def self.coder
    {
      1000 => 'M',
      900 => 'CM',
      500 => 'D',
      400 => 'CD',
      100 => 'C',
      90 => 'XC',
      50 => 'L',
      40 => 'XL',
      10 => 'X',
      9 => 'IX',
      5 => 'V',
      4 => 'IV',
      1 => 'I',
    }
  end
end
