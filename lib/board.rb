require 'cell.rb'

class Board
	attr_reader :grid

	def initialize()
		@grid = Array.new([[], [], [], [], [], [], []])
		
		7.times() do |column|
			6.times() do |row|
				@grid[column] << Cell.new()
			end
		end
	end

	def drop_chip(column, chip)
		dropped = false
		@grid[column].each do |cell|
			if cell.value == nil
				cell.set_value(chip) 
				dropped = true
				break
			end
		end
			dropped
	end
	
	def column_connect?()
		connected = false
		number_in_a_row = 0
		prev = nil
		@grid.each do |column|
			column.each do |cel|
				if prev == cel.value
					unless prev == nil
						number_in_a_row += 1 
					end
				else
					number_in_a_row = 0
				end
				prev = cel.value
				if number_in_a_row == 3
					connected = true
					break
				end
			end
		end
		connected
	end

	def row_connect?()
		connected = false
		number_in_a_row = 0
		prev = nil
		6.times do |row|
			7.times do |column|
				cel = @grid[column][row]
				if cel.value == prev
					unless prev == nil
						number_in_a_row += 1
					end
				else
					number_in_a_row = 0
				end
				prev = cel.value
				if number_in_a_row == 3
					connected = true
					break
				end
			end
		end
		connected
	end
	
	private
	attr_writer :grid

end
