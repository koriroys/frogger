class Grid
  def initialize(color: nil)
    @color = Gosu::Color::GREEN
  end

  def draw(window)
    window.draw_line(Frogger::CENTER_X, Frogger::CENTER_Y, @color,
      Frogger::WIDTH, Frogger::HEIGHT, @color, z = -1)
    window.draw_line(Frogger::CENTER_X, Frogger::CENTER_Y, @color,
      0, 0, @color, z = -1)
    window.draw_line(Frogger::CENTER_X, Frogger::CENTER_Y, @color,
      0, Frogger::HEIGHT, @color, z = -1)
    window.draw_line(Frogger::CENTER_X, Frogger::CENTER_Y, @color,
      Frogger::WIDTH, 0, @color, z = -1)

    [
      # two grid subdivisions
      [Frogger::WIDTH/4, Frogger::HEIGHT/4],
      # four grid subdivisions
      [Frogger::WIDTH/4 * 1.5, Frogger::HEIGHT/4 * 1.5],
      [Frogger::WIDTH/4 * 0.5, Frogger::HEIGHT/4 * 0.5],
      # 8 grid subdivisions
      [Frogger::WIDTH/8 * 0.5, Frogger::HEIGHT/8 * 0.5],
      [Frogger::WIDTH/8 * 1.5, Frogger::HEIGHT/8 * 1.5],
      [Frogger::WIDTH/8 * 2.5, Frogger::HEIGHT/8 * 2.5],
      [Frogger::WIDTH/8 * 3.5, Frogger::HEIGHT/8 * 3.5],
      # 16 grid subdivisions
      [Frogger::WIDTH/16 * 0.5, Frogger::HEIGHT/16 * 0.5],
      [Frogger::WIDTH/16 * 1.5, Frogger::HEIGHT/16 * 1.5],
      [Frogger::WIDTH/16 * 2.5, Frogger::HEIGHT/16 * 2.5],
      [Frogger::WIDTH/16 * 3.5, Frogger::HEIGHT/16 * 3.5],
      [Frogger::WIDTH/16 * 4.5, Frogger::HEIGHT/16 * 4.5],
      [Frogger::WIDTH/16 * 5.5, Frogger::HEIGHT/16 * 5.5],
      [Frogger::WIDTH/16 * 6.5, Frogger::HEIGHT/16 * 6.5],
      [Frogger::WIDTH/16 * 7.5, Frogger::HEIGHT/16 * 7.5],
    ].each do |x,y|
      draw_box(x, y, Frogger::WIDTH - x, Frogger::HEIGHT - y, window)
    end
  end

  def draw_box(x1, y1, x2, y2, window)
    window.draw_line(x1, y1, @color, x2, y1, @color, z = -1)
    window.draw_line(x2, y1, @color, x2, y2, @color, z = -1)
    window.draw_line(x2, y2, @color, x1, y2, @color, z = -1)
    window.draw_line(x1, y2, @color, x1, y1, @color, z = -1)
  end
end