def top_3_words(text)
  numbers_of_use = text.scan(/\w+[-\'\w]*/).map(&:downcase).inject(Hash.new(0)) { |hash, word| hash[word] += 1; hash }
  numbers_of_use.sort_by { |_k, v| v }.reverse[0..2].to_h.keys
end
