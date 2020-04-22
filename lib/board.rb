require 'cell.rb'

class Board
	attr_accessor :line_one, :line_two, :line_three, :line_four, :line_five, :line_six, :line_seven

	def initialize()
		@line_one = [Cell.new(), Cell.new(), Cell.new(), Cell.new(), Cell.new(), Cell.new()]
		@line_two = [Cell.new(), Cell.new(), Cell.new(), Cell.new(), Cell.new(), Cell.new()]
		@line_three = [Cell.new(), Cell.new(), Cell.new(), Cell.new(), Cell.new(), Cell.new()]
		@line_four = [Cell.new(), Cell.new(), Cell.new(), Cell.new(), Cell.new(), Cell.new()]
		@line_five = [Cell.new(), Cell.new(), Cell.new(), Cell.new(), Cell.new(), Cell.new()]
		@line_six = [Cell.new(), Cell.new(), Cell.new(), Cell.new(), Cell.new(), Cell.new()]
		@line_seven = [Cell.new(), Cell.new(), Cell.new(), Cell.new(), Cell.new(), Cell.new()]
	end

	def drop_chip(row, move)
		line = self.instance_variable_get("@#{row}")
		dropped = false
		line.each do |cell|
			if cell.value == nil
				cell.set_value(move)
				dropped = true
			end
			break if dropped 
		end
		dropped
	end

	private
	attr_writer :line_one, :line_two, :line_three, :line_four, :line_five, :line_six, :line_seven

end
