require "hasu"

Hasu.load "frog.rb"

class Frogger < Hasu::Window
  WIDTH = 768
  HEIGHT = 576
  CENTER_X = WIDTH / 2
  CENTER_Y = HEIGHT / 2
  COLORS = Gosu::Color.constants.slice(4..-1).map { |color| Gosu::Color.const_get(color) }

  def initialize
    super(WIDTH, HEIGHT, false)
  end

  def reset
    @frogs = Array.new(100) { Frog.new }
    @font = Gosu::Font.new(self, "Arial", 12)
  end

  def draw
    @frogs.each { |f| f.draw(self) }
  end

  def update
    @frogs.each(&:move!)

    @frogs.map! do |frog|
      if frog.off_right? || frog.off_left? || frog.off_bottom? || frog.off_top?
        Frog.new
      else
        frog
      end
    end

    if button_down?(Gosu::KbDown)
      @frogs.each { |frog| frog.speed -= 1 }
    end
  end

  def button_down(button)
    case button
    when Gosu::KbUp
      color = COLORS.sample
      @frogs.each { |frog| frog.tail_color = color }
    when Gosu::KbEscape
      close
    end
  end
end

Frogger.run