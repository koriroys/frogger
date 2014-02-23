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
      [19, 15],
      [39, 30],
      [59, 45],
      [79, 60],
      [99, 75],
      [119, 90],
      [139, 105],
      [159, 120],
      [179, 135],
      [199, 150],
      [219, 165],
      [239, 180],
      [259, 195],
      [279, 210],
      [299, 225],
      [319, 240],
      [339, 255],
      [359, 270],
      [379, 285],
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