class Cell
	attr_reader :value, :left, :up, :up_r, :up_l

	def initialize(value = nil)
		@value = value
		@left = nil
		@up = nil
		@up_l = nil
		@up_r = nil
	end

	def set_value(value)
		@value = value
	end
	
	def connect_left(cell)
		@left = cell
	end

	def connect_up(cell)
		@up = cell
	end

	def connect_up_l(cell)
		@up_l = cell
	end

	def connect_up_r(cell)
		@up_r = cell
	end

	private
	attr_writer :value, :left, :up, :up_r, :up_l

end
