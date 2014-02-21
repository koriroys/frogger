class Frog
  SIZE = 16

  attr_reader :x, :y, :angle, :speed

  def initialize(angle = rand(0..359))
    @x = rand(1..Frogger::WIDTH)
    @y = rand(1..Frogger::HEIGHT)
    @color = Gosu::Color.argb(255, rand(0..255), rand(0..255), rand(0..255))
    # @color = Gosu::Color.const_get(Gosu::Color.constants.slice(4..-1).sample)

    @angle = angle
    @speed = [4,8,12,16,20].sample
  end

  def dx
    Gosu.offset_x(angle, speed)
  end

  def dy
    Gosu.offset_y(angle, speed)
  end

  def move!
    @x += dx
    @y += dy

    if off_bottom?
      @angle = Gosu.angle(0, 0, dx, -dy)
    elsif off_top?
      @angle = Gosu.angle(0, 0, dx, -dy)
    end
  end

  def x1; @x - SIZE/2; end
  def x2; @x + SIZE/2; end
  def y1; @y - SIZE/2; end
  def y2; @y + SIZE/2; end

  def draw(window)
    window.draw_quad(
      x1, y1, @color,
      x1, y2, @color,
      x2, y2, @color,
      x2, y1, @color,
    )
  end

  def off_top?
    y1 < 0
  end

  def off_bottom?
    y2 > Frogger::HEIGHT
  end

  def off_left?
    x1 < 0
  end

  def off_right?
    x2 > Frogger::WIDTH
  end
end