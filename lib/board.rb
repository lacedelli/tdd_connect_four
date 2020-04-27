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
		value = nil
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
					value = prev
					connected = true
					return [connected, value]
				end
			end
		end
		[false, nil]
	end

	def row_connect?()
		connected = false
		number_in_a_row = 0
		prev = nil
		value = nil
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
					value = prev
					connected = true
					return [connected, value]
				end
			end
		end
		[false, nil]
	end

	def left_to_right_connect?()

		6.times do |row|
			7.times do |column|
				cell = @grid[column][row]
				unless cell.value.nil?
					unless @grid[column + 1][row - 1].nil?
						n_cell = @grid[column + 1][row - 1]
						if n_cell.value == cell.value
							if @grid[column + 2][row - 2].value == cell.value
								if @grid[column + 3][row - 3].value == cell.value
									return [true, cell.value]
								end
							end
						end
					end
				end
			end
		end
	end
	
	def right_to_left_connect?()
		return nil
	end


	private
	attr_writer :grid
	
	def connect_cell(coord)
		# Get position of cell
		cell = @grid[coord[0], coord[1]]
		# check for availavility of up
		# check for right
		# check for up left
		# check for up right
	end

end
