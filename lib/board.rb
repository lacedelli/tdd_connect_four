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
		@grid[column].each do |cell|
			if cell.value.nil?
				cell.set_value(chip)
				connect_cell([column, @grid[column].index(cell)])
				return true
			end
		end
		false
	end
	
	def column_connect?()
		counter = 0
		@grid.each do |column|
			column.each do |space|
				cell = space
				unless cell.value.nil?
					if cell.value() == cell.up().value()
						return vertical_connection(cell, 0)
					end
				end
			end
		end
		false
	end

	def row_connect?()
		counter = 0
		@grid.each do |column|
			column.each do |space|
				cell = space
				unless cell.value.nil?
					if cell.value() == cell.right().value()
						return horizontal_connection(cell, 0)
					end
				end
			end
		end
		false
	end

	def left_to_right_connect?()
		return nil
	end
	
	def right_to_left_connect?()
		return nil
	end


	private
	attr_writer :grid

	def vertical_connection(cell, number)
		return if cell.nil?
		return [true, cell.value()] if number == 3
		if cell.value() == cell.up().value()
			vertical_connection(cell.up(), number + 1)
		end
	end

	def horizontal_connection(cell, number)
		return if cell.nil?
		return [true, cell.value()] if number == 3
		if cell.value() == cell.right().value
			horizontal_connection(cell.right(), number + 1)
		end
	end
	
	def connect_cell(coord)
		row_lim = 5
		col_lim = 6
		cell = @grid[coord[0]][coord[1]]
		# check for availavility of up
		if coord[0] <= col_lim && coord[1] + 1 <= row_lim
			if coord[0] >= 0 && coord[1] + 1 >= 0
				cell.connect_up(@grid[coord[0]][ coord[1] + 1])
			end
		end
		# check for right
		if coord[0] + 1 <= col_lim && coord[1] <= row_lim
			if coord[0] + 1  >= 0 && coord[1] >= 0
				cell.connect_right(@grid[coord[0] + 1][coord[1]])
			end
		end
		# check for up left
		if coord[0] - 1 <= col_lim && coord[1] + 1 <= row_lim
			if coord[0] - 1 >= 0 && coord[1] + 1 >= 0
				cell.connect_up_l(@grid[coord[0] - 1][coord[1] + 1])
			end
		end
		# check for up right
		if coord[0] + 1 <= col_lim && coord[1] + 1 <= row_lim
			if coord[0] + 1  >= 0 && coord[1] + 1 >= 0
				cell.connect_up_r(@grid[coord[0] + 1][coord[1] + 1])
			end
		end
	end

end
