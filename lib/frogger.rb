require "gosu"
require_relative "frogger/window"
require_relative "frogger/player"

module Frogger
  def self.run
    Window.new.show
  end
end

Frogger.run
