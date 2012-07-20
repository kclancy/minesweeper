module MineSweeper
  class Grid
    attr_accessor :rows, :cols

    def validate?
      (1..100).include?(@rows) and (1..100).include?(@cols)
    end
  end
end