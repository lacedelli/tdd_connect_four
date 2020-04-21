require "./lib/cell.rb"

describe Cell do
	context "Make a new cell" do
		cell = Cell.new()

		it "creates an empty container to put a value in" do
			expect(cell.value()).to eq(nil)
		end
		
		it "sets a value with command set_value()" do
			cell.set_value("x")
			expect(cell.value()).to eq("x")
		end
	end
end
