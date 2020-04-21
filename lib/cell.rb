class Cell
	attr_reader :value

	def initialize(value = nil)
		@value = value
	end

	def set_value(value)
		@value = value
	end

	private
	attr_writer :value

end
