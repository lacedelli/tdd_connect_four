require './lib/board.rb'

describe Board do

	context "create a new board" do
		board = Board.new()

		it "creates line_one" do
			expect(board.line_one()).to eq([nil, nil, nil, nil, nil, nil])
		end

		it "creates line_two" do
			expect(board.line_two()).to eq([nil, nil, nil, nil, nil, nil])
		end
		
		it "creates line_three" do
			expect(board.line_three()).to eq([nil, nil, nil, nil, nil, nil])
		end

		it "creates line_four" do
			expect(board.line_four()).to eq([nil, nil, nil, nil, nil, nil])
		end

		it "creates line_five" do
			expect(board.line_five()).to eq([nil, nil, nil, nil, nil, nil])
		end

		it "creates line_six" do
			expect(board.line_six()).to eq([nil, nil, nil, nil, nil, nil])
		end

		it "creates line_seven" do
			expect(board.line_seven()).to eq([nil, nil, nil, nil, nil, nil])
		end

	end
end
