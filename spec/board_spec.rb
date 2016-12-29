require 'board.rb'

describe Board do
	let(:test) { Board.new }
	context "#initialize" do
		it "check if grid is populated" do
			expect(test.grid).to be_instance_of(Array)
		end
	end

	context "#get_cell" do
		it "returns a specific cell" do
			expect(test.get_cell(0,0).value).to eql("")
		end
	end

	context "#set_cell" do
		it "changes the value of a cell " do
			test.set_cell(0,0, "blue")
			expect(test.get_cell(0,0).value).to eql("blue")
			#test.show_grid
		end
	end

	TestCell = Struct.new(:value)
		let(:x_cell) { TestCell.new("X") }
		let(:y_cell) { TestCell.new("Y") }
		let(:empty) { TestCell.new }

	context "#game_over" do
		it "returns :winner if winner? is true" do
			allow(test).to receive(:winner?).and_return(true)
			allow(test).to receive(:draw?).and_return(false)
			expect(test.game_over).to eq(:winner)
		end

		it "returns :draw if winner? is false and draw? is true" do
			allow(test).to receive(:winner?).and_return(false)
			allow(test).to receive(:draw?).and_return(true)
			expect(test.game_over).to eq(:draw)
		end

		it "returns :winner if winner? and draw? is true" do
			allow(test).to receive(:winner?).and_return(true)
			allow(test).to receive(:draw?).and_return(true)
			expect(test.game_over).to eq(:winner)
		end

		it "returns false if winner? and draw? is false" do
			allow(test).to receive(:winner?).and_return(false)
			allow(test).to receive(:draw?).and_return(false)
			expect(test.game_over).to be false
		end

		it "returns :winner when a valid rows has objects with values that are the same" do
			grid = [
					[empty, empty, empty, empty, empty, empty, empty],
					[empty, empty, empty, empty, empty, empty, empty],
					[empty, empty, empty, empty, empty, empty, empty],
					[empty, empty, empty, empty, empty, empty, empty],
					[empty, empty, empty, empty, empty, empty, empty],
					[x_cell, x_cell, x_cell, x_cell, y_cell, y_cell, y_cell]
			]
			board = Board.new(grid: grid)
			expect(board.game_over).to eq :winner
		end

		it "returns :winner when a valid column has objects with same values" do
			grid = [
				[empty, empty, empty, empty, empty, empty, empty],
				[empty, empty, empty, empty, empty, empty, empty],
				[x_cell, x_cell, y_cell, x_cell, y_cell, y_cell, y_cell],
				[x_cell, y_cell, x_cell, y_cell, x_cell, x_cell, x_cell],
				[x_cell, x_cell, y_cell, x_cell, y_cell, y_cell, y_cell],
				[x_cell, x_cell, y_cell, x_cell, y_cell, y_cell, y_cell]
			
			]
			board = Board.new(grid: grid)
			expect(board.game_over).to eq :winner
		end

		it "returns :winner when a valid diagonal has objects with same values" do
			grid = [
				[empty, empty, empty, empty, empty, empty, empty],
				[empty, empty, empty, empty, empty, empty, empty],
				[empty, empty, empty, x_cell, empty, empty, empty],
				[empty, empty, x_cell, empty, empty, empty, empty],
				[empty, x_cell, empty, empty, empty, empty, empty],
				[x_cell, empty, empty, empty, empty, empty, empty],
			]
			board = Board.new(grid: grid)
		#	puts board.get_cell(0,5)
		#	puts board.get_cell(1,4)
		#	puts board.get_cell(2,3)
		#	puts board.get_cell(3,2)
			expect(board.game_over).to eq :winner
		end

		it "returns :draw when all spaces on the board are taken" do
			grid = [
				[x_cell, y_cell, x_cell, y_cell, x_cell, y_cell, x_cell],
				[x_cell, y_cell, x_cell, y_cell, x_cell, y_cell, x_cell],
				[x_cell, y_cell, x_cell, y_cell, x_cell, y_cell, x_cell],
				[y_cell, x_cell, y_cell, x_cell, y_cell, x_cell, y_cell],
				[y_cell, x_cell, y_cell, x_cell, y_cell, x_cell, y_cell],
				[y_cell, x_cell, y_cell, x_cell, y_cell, x_cell, y_cell]
			]
			board = Board.new(grid: grid)
			expect(board.game_over).to eq :draw
		end

		it "returns false where there is no winner or draw" do
			grid = [
				[empty, empty, empty, empty, empty, empty, empty],
				[empty, empty, empty, empty, empty, empty, empty],
				[empty, empty, empty, empty, empty, empty, empty],
				[empty, empty, empty, empty, empty, empty, empty],
				[empty, empty, empty, empty, empty, empty, empty],
				[y_cell, x_cell, y_cell, x_cell, y_cell, x_cell, y_cell],
			]
			board = Board.new(grid: grid)
			expect(board.game_over).to eq false
		end
	end

	context "#show_grid" do
		it "shows empty grid" do
			test.show_grid
		end
	end
end