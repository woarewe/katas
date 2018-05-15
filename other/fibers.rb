# flenagan and matsumoto examples

def fibonacci_generator(first, second)
  Fiber.new do
    x, y = first, second
    loop do
      Fiber.yield y
      x, y = y, x + y
    end
  end
end

puts 'Function example'
g = fibonacci_generator(0, 1)
10.times { print g.resume, ' ' }
puts ''


class FibonacciGenerator

  include Enumerable

  def initialize
    @first = 0
    @second = 1
    @fiber = Fiber.new do
      loop do
        @first, @second = @second, @first + @second
        Fiber.yield @first
      end
    end
  end

  def next
    @fiber.resume
  end

  def rewind
    @first = 0
    @second = 0
  end

  def each
    loop { yield self.next }
  end
end

puts 'Class example'
object_generator = FibonacciGenerator.new
10.times { print object_generator.next, ' ' }
puts ''


class Generator
  def initialize(enumerable)
    @enumerable = enumerable
    create_fiber
  end

  def next
    @fiber.resume
  end

  def rewind
    create_fiber
  end

  private

  def create_fiber
    @fiber = Fiber.new do
      @enumerable.each { |x| Fiber.yield(x) }
      raise StopIteration
    end
  end
end


g = Generator.new(1..10)

loop { print g.next, ' ' }
puts ''
g.rewind
loop { print g.next, ' ' }
puts



