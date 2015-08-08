module Frogger
  class Window < Gosu::Window
    FRAMES_PER_MOVE = 20

    def initialize
      width = 800
      height = 520
      super(width, height)
      self.caption = "frogger"
      @player = Player.new
      @coordinates = Gosu::Font.new(self, Gosu::default_font_name, 20)
      @background_image = Gosu::Image.new("images/background.png", :tileable => true)
      @counter = 0
      @move = nil
    end

    def update
      if @counter < FRAMES_PER_MOVE && @move.nil?
        if Gosu::button_down? Gosu::KbUp or Gosu::button_down? Gosu::GpUp then
          @move = :move_up
        end
        if Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpRight then
          @move = :move_right
        end
        if Gosu::button_down? Gosu::KbDown or Gosu::button_down? Gosu::GpDown then
          @move = :move_down
        end
        if Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpLeft then
          @move = :move_left
        end

        @counter += 1
      elsif @counter < FRAMES_PER_MOVE
        @counter += 1
      else
        @player.send(@move) unless @move.nil?
        @counter = 0
        @move = nil
      end
    end

    def draw
      @player.draw
      @coordinates.draw("x: #{@player.position_x}, y: #{@player.position_y}", 0, 0, 1, 1.0, 1.0, 0xff_000000)
      @background_image.draw(0, 0, 0)
    end

    def button_down(id)
      if id == Gosu::KbEscape
        close
      end
    end
  end
end
