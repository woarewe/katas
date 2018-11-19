require 'active_support/core_ext/string'

module Spellable

  class MagicWrapper
  end

end

class Thing
  include Spellable

  attr_accessor :name

  def initialize(name)
    @name = name
  end
end
