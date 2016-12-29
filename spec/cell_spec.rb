require 'cell'

describe Cell do
	context "#initialize" do
		let(:default) { Cell.new }
		it "initialize a cell with a nil value " do
			expect(default.value).to eq ""
		end
	end
end