module MineSweeper
  class Grid
    attr_accessor :rows, :cols, :line_array

    def initialize
      @line_array = []
    end

    def validate?
      (1..100).include?(@rows) and (1..100).include?(@cols)
    end

    def add_line(line="")

      return false unless line =~ /^(\.|\*){#{@cols}}$/
      raise "too long" if @line_array.length == @rows

      @line_array << line

      true
    end

    def pad_grid
      padded_array = @line_array.dup

      padded_array.unshift(" " * @cols) << (" " * @cols)
      padded_array.map {|e| " " << e << " "}
    end

    def score_square(row_pos, col_pos)
      padded_grid = pad_grid
      offset_row_pos, offset_col_pos = offset_coordinates(row_pos, col_pos)
      score = 0

      return "*" if padded_grid[offset_row_pos][offset_col_pos] == "*"

      (-1..1).each do |x|       
        (-1..1).each do |y|          
          i = offset_row_pos + x
          j = offset_col_pos + y
          
          score += 1 if padded_grid[i][j] == "*"          
        end
      end

      score.to_s
    end

    def offset_coordinates(row_pos, col_pos)
      [row_pos + 1, col_pos + 1]
    end
  end
end