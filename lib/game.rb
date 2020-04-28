require "board.rb"

class Game
	attr_reader :board

	def initialize()
		@board = Board.new()
	end

	def valid_move?(pos)
		if pos < 1 || pos > 7
			false
		else
			true
		end
	end
end
