require "./lib/board.rb"

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

	def play_round(player)
		loop do
			puts "Select a column to drop a chip in"
			puts board.render()
			move = get_move()
			if valid_move?(move)
				# Subtract one from the move to fit 0-index arr
				chip = @board.drop_chip(move - 1, player)
				if chip
					break
				else
					puts "Column is already full, please make another choice"
					next
				end
			else
				puts "That move isn't permitted, please make another choice"
				next
			end
		end
	end

	def play_game()
		player_1 = "\u2366".encode('utf-8')
		player_2 = "\u236C".encode("utf-8")
		player_switch = 0
		current_player = player_1
		loop do
			play_round(current_player)
			victory = victory?()
			unless victory == false
				puts "#{current_player} has won!"
				puts board.render()
				break
			else
				player_switch += 1
				if player_switch % 2 == 0
					current_player = player_1
				else
					current_player = player_2
				end
			end
		end
	end

	private

	def get_move()
		puts "Your options are 1 through to 7"
		gets.chomp().to_i
	end
	
	def victory?()
		assess = board.column_connect?()
		if assess.instance_of?(Array)
		 return assess
		end
		assess = board.row_connect?()
		if assess.instance_of?(Array)
			return assess
		end
		assess = board.left_to_right_connect?()
		if assess.instance_of?(Array)
			return assess
		end
		assess = board.right_to_left_connect?()
		if assess.instance_of?(Array)
			return assess
		end
		false
	end

end

g = Game.new()
g.play_game()
