require './lib/game.rb'

describe Game do
	game = Game.new()

	it "creates an instance of board" do
		expect(game.board().instance_of?(Board)).to eq(true)
	end

	it "Returns false when moving below range" do
		move = game.valid_move?(-1)
		expect(move).to eq(false)
	end

	it "Returns false when moving above range" do
		move = game.valid_move?(8)
		expect(move).to eq(false)
	end
	
	it "returnst true when player makes move in 1" do
		move = game.valid_move?(1)
		expect(move).to eq(true)
	end

	it "returns true when player makes move in 7" do
		move = game.valid_move?(7)
		expect(move).to eq(true)
	end

end
