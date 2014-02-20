require "hasu"

Hasu.load "frog.rb"

class Frogger < Hasu::Window
  WIDTH = 768
  HEIGHT = 576

  def initialize
    super(WIDTH, HEIGHT, false)
  end

  def reset
    @frogs = Array.new(10) { Frog.new }

    @font = Gosu::Font.new(self, "Arial", 12)
  end

  def draw
    @frogs.each { |f| f.draw(self) }
    @frogs.each.with_index do |frog, index|
      @font.draw("#{index}: #{frog.angle}", 30, index * 13, 0)
    end

    #
    # @font.draw(@frog2.angle, 30, 60, 0)
    # @font.draw(@right_score, WIDTH - 50, 30, 0)
  end

  def update
    @frogs.each(&:move!)

    # @left_paddle.ai_move!(@frog)
      # if button_down?(Gosu::KbW)
      #   @left_paddle.up!
      # end
      # if button_down?(Gosu::KbS)
      #   @left_paddle.down!
      # end

    # if button_down?(Gosu::KbUp)
    #   @frog.move!
    # end

    # if button_down?(Gosu::KbDown)
    #   @frog.move!
    # end

    @frogs.map! do |frog|
      if frog.off_right? || frog.off_left?
        Frog.new
      else
        frog
      end
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