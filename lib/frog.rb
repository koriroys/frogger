class Frog
  SIZE = 16

  attr_reader :x, :y, :angle, :speed

  def initialize(angle = rand(0..359))
    @x = Frogger::WIDTH/2
    @y = Frogger::HEIGHT/2

    @angle = angle
    @speed = 16
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
    color = Gosu::Color::GREEN

    window.draw_quad(
      x1, y1, color,
      x1, y2, color,
      x2, y2, color,
      x2, y1, color,
    )
  end

  # def bounce_off_paddle!(paddle)
  #   case paddle.side
  #   when :left
  #     @x = paddle.x2 + SIZE / 2
  #   when :right
  #     @x = paddle.x1 - SIZE / 2
  #   end

  #   ratio = (y - paddle.y) / Paddle::HEIGHT
  #   @angle = ratio * 120 + 90
  #   @angle *= -1 if paddle.side == :right
  #   @speed *= 1.1
  # end

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