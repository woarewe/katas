DECODER = {
  'I' => 1,
  'V' => 5,
  'X' => 10,
  'L' => 50,
  'C' => 100,
  'D' => 500,
  'M' => 1000
}.freeze

def compare_letters(first, second)
  return true unless second
  DECODER[first] >= DECODER[second]
end

def solution(str)
  letters = str.split(//)
  letters.each_with_index.inject(0) do |value, pair|
    value + DECODER[pair.first] * (compare_letters(pair.first, letters[pair.last + 1]) ? 1 : -1)
  end
end