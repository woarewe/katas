require 'matrix'

DIRECTIONS = {
  right: [0, 1],
  down: [1, 0],
  left: [0, -1],
  up: [-1, 0]
}.each { |_k, v| v.freeze }.freeze


def check_position

end
def spiralize(size)
  matrix = Matrix.build(size) { 0 }.to_a
  i = 0
  j = 0
  row_borders = [-1, size]
  column_borders = [-1, size]
  step = DIRECTIONS[:right]
  (size**2).times do
    matrix[i][j] = 1
    i += step.first
    j += step.last
    print "#{i}, #{j}\n"

    if row_borders.include?(i) || column_borders.include?(j)
      step =
        case step
        when DIRECTIONS[:right]
          column_borders[1] -= 1
          j -= 1
          DIRECTIONS[:down]
        when DIRECTIONS[:down]
          row_borders[1] -= 1
          i -= 1
          DIRECTIONS[:left]
        when DIRECTIONS[:left]
          column_borders[0] += 1
          j += 1
          DIRECTIONS[:up]
        when DIRECTIONS[:up]
          i += 1
          row_borders[0] += 1
          DIRECTIONS[:right]
        end
    else
      next
    end
  end
  matrix
end

spiralize(3).each { |ary| print "#{ary}\n" }
