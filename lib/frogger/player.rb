module Frogger
  class Player
    def initialize
      @image = Gosu::Image.new("images/frogger.bmp")
      @position_x = 10
      @position_y = 12
    end

    attr_reader :position_x, :position_y

    def move_up
      @position_y -= 1 if position_y > 0
    end

    def move_right
      @position_x += 1 if position_x < 19
    end

    def move_down
      @position_y += 1 if position_y < 12
    end

    def move_left
      @position_x -= 1 if position_x > 1
    end

    def draw
      @image.draw_rot(@position_x * 40, @position_y * 40, 1, 0.0, center_x=0.5, center_y=0.0, scale_x=0.5, scale_y=0.5)
    end
  end
end
