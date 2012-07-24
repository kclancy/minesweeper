def create_grid(grid, rows, cols)
  grid.rows = rows
  grid.cols = cols

  (1..rows).each do
    grid.add_line("." * cols)
  end

  grid
end