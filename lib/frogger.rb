require "hasu"

Hasu.load "frog.rb"

class Frogger < Hasu::Window
  WIDTH = 768
  HEIGHT = 576

  def initialize
    super(WIDTH, HEIGHT, false)
  end

  def reset
    @frog = Frog.new
    @frog2 = Frog.new

    @font = Gosu::Font.new(self, "Arial", 30)
  end

  def draw
    @frog.draw(self)
    @frog2.draw(self)

    @font.draw(@frog.angle, 30, 30, 0)
    @font.draw(@frog2.angle, 30, 60, 0)
    # @font.draw(@right_score, WIDTH - 50, 30, 0)
  end

  def update
    @frog.move!
    @frog2.move!

    # @left_paddle.ai_move!(@frog)
      # if button_down?(Gosu::KbW)
      #   @left_paddle.up!
      # end
      # if button_down?(Gosu::KbS)
      #   @left_paddle.down!
      # end

    if button_down?(Gosu::KbUp)
      @frog.move!
    end

    if button_down?(Gosu::KbDown)
      @frog.move!
    end

    if @frog.off_right?
      @frog = Frog.new
    elsif @frog.off_left?
      @frog = Frog.new
    end

    if @frog2.off_right?
      @frog2 = Frog.new
    elsif @frog2.off_left?
      @frog2 = Frog.new
    end
  end

  def button_down(button)
    case button
    when Gosu::KbEscape
      close
    end
  end
end

Frogger.run