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

		it "returns [true, chip value] when a column is complete" do
			expect(board.column_connect?()).to eq([true, "X"])
		end
	end

	context "second column test" do
		board = Board.new()
		4.times do
			board.drop_chip(5, "Y")
		end

		it "returns [true, chip value] when column is connected" do
			expect(board.column_connect?()).to eq([true, "Y"])
		end
	end

	context "Test for horizontal connection" do
		board = Board.new()
		4.times do |column|
			board.drop_chip(column, "A")
		end
		it "row_connect?() returns [true, chip value]" do
			expect(board.row_connect?()).to eq([true, "A"])
		end
	end

	context "test for diagonal left to right connection" do
		board = Board.new()
		3.times do 
			board.drop_chip(0, "B")
		end
		2.times do
			board.drop_chip(1, "B")
		end
		board.drop_chip(2, "B")
		4.times do |column|
			board.drop_chip(column, "A")
		end

		it "returns false for a connected vertical test" do
			expect(board.column_connect?()).not_to eq([true, "A"])
		end
		
		it "returns false for a connected horizontal test" do
			expect(board.row_connect?()).not_to eq([true, "A"])
		end
		
		it"returns true for a connected diagonal test" do
			expect(board.diagonal_connect?()).to eq([true, "A"])
		end
	end

end
