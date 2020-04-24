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

	def diagonal_connect?(cell = @grid[0][0], coord = [0,0], count = 0)
		# return if cell == nil
		# return [true, value] if count == 4
		return [true, cell.value] if count == 4
		# current cel = @grid[coord[0]][coord[1]] 
		current_cell = cell
		# check grid at @grid[coord[0] + 1][coord[1] - 1]
		diag_l_to_r = @grid[coord[0] + 1][coord[1] - 1]
		# if checked cell.value == current cel.value
		if diag_l_to_r.value == current_cell.value
		# recurse on itself passing matching cel as the current as well as coordinates count + 1 
			diagonal_connect?(diag_l_to_r, [coord[0] + 1, coord[1] - 1], count + 1)
		#elsif # if r to l matches	
		#
		# TODO MAKE AN ALGORITHM FOR RIGHT TO LEFT TRAVERSAL
		#
		else
			#means no matches
			#if we can traverse vertically, do so
			if !@grid[coord[0]][coord[1] + 1].nil?
				diagonal_connect?(@grid[coord[0]][coord[1]+ 1], [coord[0]][coord[1] + 1], count = 0)
			end	
			#if we can traverse horizontally, but not vertically, do so
			#if we can not traverse either way return [false, nil]
		end
		#
		# BAD ITERATION METHOD THAT WORKS
		#6.times do |row|
			#7.times do |column|
				#cell = @grid[column][row]
				#unless cell.value.nil?
					#unless @grid[column + 1][row - 1].nil?
						#n_cell = @grid[column + 1][row - 1]
						#if n_cell.value == cell.value
							#if @grid[column + 2][row - 2].value == cell.value
								#if @grid[column + 3][row - 3].value == cell.value
									#return [true, cell.value]
								#end
							#end
						#end
					#end
					#unless @grid[column - 1][row - 1].nil?
						#
					#end
				#end
			#end
		#end
	end
	
	private
	attr_writer :grid

end
