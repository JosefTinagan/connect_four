require 'core_extensions'

describe Array do
	context "#all_empty?" do
		it "returns true if all elemenets of the rray is empty" do
			expect(["","",""].all_empty?).to be true
		end

		it "returns false if some of the array are not empty" do
			expect(["A","",""].all_empty?).to be false
		end

		it "returns true for an empty Array" do
			expect([].all_empty?).to be true
		end
	end

	context "#all_same?" do
		it "returns true if all elements of the Array are the same" do
			expect(["B","B","B"].all_same?).to be true
		end

		it "returns false if some of the elements of the Array are not the same" do
			expect(["B","B","A"].all_same?).to be false
		end

		it "returns true for an empty array" do
			expect([].all_same?).to be_truthy
		end
	end

	context "#any_empty?" do
		it "returns true if any of the elements of the Array is empty" do
			expect(["","A","A"].any_empty?).to be_truthy
		end

		it "returns false if none of the elements of the Array is empty" do
			expect(["A","A","A"].any_empty?).to be_falsey
		end

		it "returns false if passed an empty array" do
			expect([].any_empty?).to be_falsey
		end
	end

	context "#none_empty?" do
		it "returns true if none of the elements of the Array is empty" do
			expect(["A","A","A"].none_empty?).to be_truthy
		end

		it "returns false if any of the elements is not empty" do
			expect(["A","","A"].none_empty?).to be_falsey
		end

		it "retuns true if passed an empty array" do
			expect([].none_empty?).to be_truthy
		end
	end
end