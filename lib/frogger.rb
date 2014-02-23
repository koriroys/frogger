require "hasu"

Hasu.load "frog.rb"
Hasu.load "grid.rb"

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
    @grid = Grid.new
    @frame_count = 0
  end

  def draw
    @frogs.each { |f| f.draw(self) }
    # @font.draw(@frame_count, 30, 30, 0)
    # @grid.draw(self)
  end

  def update
    @frame_count += 1
    @frogs.each(&:move!)

    @frogs.each do |frog|
      if frog.off_right? || frog.off_left? || frog.off_bottom? || frog.off_top?
        frog.reset_to_start
      end
    end

    if button_down?(Gosu::KbDown)
      @frogs.each.with_index { |frog, index|
        if index.even?
          frog.speed -= 1
        else
          frog.speed += 1
        end
      }
    end
    if button_down?(Gosu::KbLeftShift) && button_down?(Gosu::KbX)
      @frogs.each(&:randomize_direction)
    end
    if button_down?(Gosu::KbE) && button_down?(Gosu::KbLeftShift)
      if @frame_count % 20 == 0
        @frogs.each(&:randomize_color)
      end
    end
  end

  def button_down(button)
    case button
    when Gosu::KbX
      @frogs.each(&:randomize_direction)
    when Gosu::KbS
      @frogs.each { |frog| frog.speed = -frog.speed }
    when Gosu::KbE
      @frogs.each(&:randomize_color)
    when Gosu::KbUp
      color = COLORS.sample
      @frogs.each { |frog| frog.tail_color = color }
    when Gosu::KbEscape
      close
    end
  end
end

Frogger.run