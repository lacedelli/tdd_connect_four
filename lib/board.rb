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

	def diagonal_connect?()
		connected = false
		number_in_a_row = 0
		value = nil
		# for each row
			# for each column
				# cel = @grid[column][row]
				# if @grid[column + 1][row + 1].data == cel.data
					# steps = 1
					# next = @grid[column + steps][row + steps]
					# until next.data == cel.data
						# steps += 1
						# number_in_a_row += 1
						# next = @grid[column + steps][row + steps]
				# if number_in_a_row == 3
					# value = cel.value 
					# connected = true
					# return [connected, value]
	end
	
	private
	attr_writer :grid

end
