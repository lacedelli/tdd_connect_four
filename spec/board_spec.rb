require './lib/board.rb'
require './lib/cell.rb'

describe Board do
	board = Board.new()
	it "Value line_one[0] is a cell" do
		expect(board.line_one[0].instance_of?(Cell)).to eql(true)
	end	
	it "Value line_five[3] is a cell" do
		expect(board.line_five[3].instance_of?(Cell)).to eql(true)
	end
	it "Value line_seven[5] is a cell" do
		expect(board.line_seven[5].instance_of?(Cell)).to eql(true)
	end

	it "returns true when valid move" do
		drop = board.drop_chip("line_one", "X")   
		expect(drop).to eq(true)
	end

	it "changes the value of first available cell" do
		expect(board.line_one[0].value).to eq("X")
	end

	it "returns false when move is not possible" do
		board.drop_chip("line_one", "X")   
		board.drop_chip("line_one", "X")   
		board.drop_chip("line_one", "X")   
		board.drop_chip("line_one", "X")   
		board.drop_chip("line_one", "X")   
		should_be_false = board.drop_chip("line_one", "X")   
		expect(should_be_false).to eq(false)
	end
end
