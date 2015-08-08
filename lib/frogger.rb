require 'gosu'

class Frogger < Gosu::Window
  def initialize
   super(640, 480, false)
   self.caption = 'Ribbit'
  end
end

window = Frogger.new
window.show
