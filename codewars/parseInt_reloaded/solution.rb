class StringifyNumber

  SPACE = ' '.freeze

  EXCEPTIONS = {
    zero: 0,
    ten: 10,
    eleven: 11,
    twelve: 12
  }.freeze

  MULTIPLIERS = {
    hundred: 100,
    thousand: 1000,
    million: 1_000_000,
    billion: 1_000_000_000
  }.freeze

  ROOTS = {
    /^on/ => 1,
    /^tw(?!el)/ => 2,
    /^th[i,r]/ => 3,
    /^fo/ => 4,
    /^fi/ => 5,
    /^si/ => 6,
    /^se/ => 7,
    /^ei/ => 8,
    /^ni/ => 9
  }.freeze

  def initialize(string)
    prepared_string = string.gsub(' and ', SPACE).gsub('-', SPACE)
    @stringify_numbers = prepared_string.split(SPACE).map(&:downcase)
  end

  def parse
    sum = 0
    streak = 0
    @stringify_numbers.each do |str|
      root = ROOTS.find { |k, _| k =~ str } &.last || EXCEPTIONS[str.to_sym]
      if root
        number = lambda_ten(str).call(root)
        streak += number
      else
        multiplier = MULTIPLIERS[str.to_sym]
        if multiplier != 100
          sum += multiplier * streak
          streak = 0
        else
          streak *= multiplier
        end
      end
    end
    sum + streak
  end

  private

  def lambda_ten(str)
    case str
    when /ty/
      ->(number) { number * 10 }
    when /teen/
      ->(number) { number + 10 }
    else
      ->(number) { number }
    end
  end
end

def parse_int(string)
  StringifyNumber.new(string).parse
end


