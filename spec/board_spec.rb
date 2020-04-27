require './lib/board.rb'
require './lib/cell.rb'

describe Board do
	context "setup and basic testing" do
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

		it "returns true when a chip has been successfuly dropped" do
			should_be_true = board.drop_chip(0, "X")
			expect(should_be_true).to eq(true)
		end

		first_cell = board.grid[0][0]

		it "has an instance of cell on the upper cell" do
			expect(first_cell.up()).to eql(board.grid[0][1])
		end

		it "has an instance of cell on right cell" do
			expect(first_cell.right()).to eql(board.grid[1][0])
		end

		it "has an instance of cell on top right" do
			expect(first_cell.up_r()).to eql(board.grid[1][1])
		end
		
		it "has nothing attached to cell on top left" do
			expect(first_cell.up_l()).to eq(nil)
		end

		it "connects to top left" do 
			board.drop_chip(1, "X")
			expect(board.grid[1][0].up_l()).to eql(board.grid[0][1])
		end
		
		it "returns true and value for row connect" do
			2.times do |i|
				board.drop_chip(i + 2, "X")
			end
			expect(board.row_connect?()).to eq([true, "X"])
		end

		it "returns true and value for column connect" do
			3.times do
				board.drop_chip(0, "X")
			end
			expect(board.column_connect?()).to eq([true, "X"])
		end

	end
end
