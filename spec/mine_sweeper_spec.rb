require 'spec_helper'
require 'mine_sweeper'

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

      describe '#add_line' do
        before(:each) do
          @grid.rows = 4
          @grid.cols = 5
        end

        it 'can only be passed valid data' do
          @grid.add_line("*....").should == true
          @grid.add_line("*****").should == true
          @grid.add_line(".....").should == true
          @grid.add_line.should == false
          @grid.add_line("xooo").should == false
          @grid.add_line(".").should == false
          @grid.add_line(".........").should == false
        end

        it 'can only be passed row number of lines' do
          @grid.add_line("*....")
          @grid.add_line(".....")
          @grid.add_line("...*.")
          @grid.add_line("*....")
          lambda {@grid.add_line("*....")}.should raise_error
        end

      end

      describe '#pad_grid' do

        it 'should pad small grid' do
          @grid = create_grid(@grid, 3, 2)

          padded_grid = @grid.pad_grid
          padded_grid.length.should == @grid.rows + 2

          padded_grid.each {|e| e.length.should == (@grid.cols + 2)}
        end

        it 'should pad large grid' do

          @grid = create_grid(@grid, 5, 5)

          padded_grid = @grid.pad_grid
          padded_grid.length.should == @grid.rows + 2

          padded_grid.each {|e| e.length.should == (@grid.cols + 2)}
        end

        it 'should pad extra large grid' do

          @grid = create_grid(@grid, 47, 62)

          padded_grid = @grid.pad_grid
          padded_grid.length.should == @grid.rows + 2

          padded_grid.each {|e| e.length.should == (@grid.cols + 2)}
        end
      end

      describe '#score_square' do

        it 'finds the mine' do
          @grid.rows = 3
          @grid.cols = 2

          @grid.add_line("*.")
          @grid.add_line("..")
          @grid.add_line("..")

          @grid.score_square(0, 0).should == "*"
          @grid.score_square(0, 1).should == "1"
        end

      end
    end
  end
end