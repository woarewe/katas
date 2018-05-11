str = '2 / 2 + 3 * 4 - 6'

class Calculator
  def evaluate(string)
    numbers = string.scan(/\d+/).map(&:to_i)
    action = string.scan(%r{[*+/-]/})
    numbers.inject do |stash, number|
    end
  end
end

Calculator.new.evaluate(str)