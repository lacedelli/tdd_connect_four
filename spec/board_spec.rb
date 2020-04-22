require './lib/board.rb'
require './lib/cell.rb'

describe Board do
	context "setup and vertical testing" do
		board = Board.new()
	
		it "has an instance of cell on Board.grid[0][0]" do
			expect(board.grid[0][0].instance_of?(Cell)).to eq(true)
		end

		it "has an instance of cell on Board.grid[6][5]" do
			expect(board.grid[6][5].instance_of?(Cell)).to eq(true)
		end

		it "has an instance of cell on Board.grid[3][2]" do
			expect(board.grid[3][2].instance_of?(Cell)).to eq(true)
		end

		it "drops a chip on a row and returns true" do
			should_be_true = board.drop_chip(0, "X")
			expect(should_be_true).to eq(true)
		end

		it "has indeed dropped the chip" do
			expect(board.grid[0][0].value).to eq("X")
		end

		5.times do 
			board.drop_chip(0, "X")
		end

		it "returns false when a move is not possible" do
			should_be_false = board.drop_chip(0, "X")
			expect(should_be_false).to eq(false)
		end

		it "returns true when a column is complete" do
			expect(board.column_connect?()).to eq(true)
		end
	end

	context "second column test" do
		board = Board.new()
		4.times do
			board.drop_chip(5, "Y")
		end

		it "returns true when column is complete" do
			expect(board.column_connect?()).to eq(true)
		end
	end

end
