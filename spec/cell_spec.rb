require "./lib/cell.rb"

describe Cell do
	cell = Cell.new()

	it "creates an empty container to put a value in" do
		expect(cell.value()).to eq(nil)
	end
	
	it "sets a value with command set_value()" do
		cell.set_value("x")
		expect(cell.value()).to eq("x")
	end

	it "connects to up" do
		cell.connect_up(Cell.new)
		expect(cell.up().instance_of?(Cell)).to eq(true)
	end

	it "connects to right" do
		cell.connect_right(Cell.new)
		expect(cell.right().instance_of?(Cell)).to eq(true)
	end

	it "connects upper left" do
		cell.connect_up_l(Cell.new)
		expect(cell.up_l().instance_of?(Cell)).to eq(true)
	end

	it "connects upper right" do 
		cell.connect_up_r(Cell.new)
		expect(cell.up_l().instance_of?(Cell)).to eq(true)
	end

end
