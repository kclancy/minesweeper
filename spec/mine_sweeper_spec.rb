require "mine_sweeper"

module MineSweeper
  describe MineSweeper do
    describe Grid do
      before(:each) do
        @grid = Grid.new
      end

      it 'can be created' do
        @grid.should be_instance_of Grid
      end

      it 'can have a row value set' do
        @grid.rows = 4
      end

      it 'can have a col value set' do
        @grid.cols = 5
      end

      describe '#validate?' do
        it 'fails if rows or cols not in range' do
          @grid.rows = 20
          @grid.validate?.should == false

          @grid.rows = 101
          @grid.cols = 1
          @grid.validate?.should == false

          @grid.rows = -11
          @grid.cols = 1
          @grid.validate?.should == false

          @grid.rows = 11
          @grid.cols = 200
          @grid.validate?.should == false

          @grid.rows = 11
          @grid.cols = -4
          @grid.validate?.should == false
        end

        it 'succeeds if rows and cols in range' do
          @grid.rows = 99
          @grid.cols = 1
          @grid.validate?.should == true
        end
      end
    end
  end
end