require 'player'

describe Player do 
	let(:test) { Player.new({color: "blue", name: "Noone"})}
	describe "#initialize" do
		context "when initialized with {}" do
			it "raises an exception" do
				expect { Player.new({}) }.to raise_error(KeyError)
			end
		end

		context "when initialized with an input" do
			it "does not raise an exception" do
				expect{test}.to_not raise_error
			end
		end
	end

	describe "#color" do
		context "get the correct color" do
			it "returns color" do
				expect(test.color).to eq("blue")
			end
		end
	end

	describe "#name" do
		context "get the correct name" do
			it "returns name" do
				expect(test.name).to eq("Noone")
			end
		end
	end
end