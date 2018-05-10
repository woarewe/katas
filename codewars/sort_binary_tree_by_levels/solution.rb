require 'psych'

class TreeNode
  attr_accessor :left
  attr_accessor :right
  attr_accessor :value
end


a = Psych.load_file('./trees.yml')

puts a.inspect

