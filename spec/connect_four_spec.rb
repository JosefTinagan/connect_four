require 'connect_four'

describe ConnectFour do

	let(:bob) { Player.new({ color: "X", name: "bob"})}
	let(:frank) { Player.new({color: "O", name: "frank"})}
	context "#initialize" do
		it "randomly selects a current player" do
			allow_any_instance_of(Array).to receive(:shuffle).and_return([frank,bob])
			game = ConnectFour.new([bob,frank])
			expect(game.current_player).to eq frank
		end

		it "randomly selects another player" do
			allow_any_instance_of(Array).to receive(:shuffle).and_return([frank,bob])
			game = ConnectFour.new([bob,frank])
			expect(game.other_player).to eq bob
		end
	end

	context "#switch_players" do
		it "will set @current_player to @other_player" do
			game = ConnectFour.new([bob,frank])
			other_player = game.other_player
			game.switch_players
			expect(game.current_player).to eq other_player
		end

		it "will set @other_player to @current_player" do
			game = ConnectFour.new([bob,frank])
			current_player = game.current_player
			game.switch_players
			expect(game.other_player).to eq current_player
		end
	end

	context "#solicit_move" do
		it "asks a player to make a move" do
			game = ConnectFour.new([bob,frank])
			allow(game).to receive(:current_player).and_return(bob)
			expected = "bob: Enter a number between 1 and 7(columns) to make your move"
			expect(game.solicit_move).to eq expected
		end
	end

	context "#get_move" do
		it "converts human_move of 0 to [0,5]" do
			game = ConnectFour.new([bob,frank])
			expect(game.get_move("1")).to eq [5,0]
		end

		it "converts human_move of 0 to [0,4] if [0,5] is not empty" do
			game = ConnectFour.new([bob,frank])
			game.board.set_cell(5,0,"x")
			expect(game.get_move("1")).to eq [4,0]
		end

		it "converts human_move of 3 to [5,2]" do
			game = ConnectFour.new([bob,frank])
			expect(game.get_move("3")).to eq [5,2]
		end

		it "converts human_move of 3 to [4,2] if [5,2] is not empty" do
			game = ConnectFour.new([bob,frank])
			game.board.set_cell(5,2,"x")
			expect(game.get_move("3")).to eq [4,2]
		end
	end

	context "#game_over_message" do
		it "returns '{current_player.name} won!' if board shows a winner" do
			game = ConnectFour.new([bob,frank])
			allow(game).to receive(:current_player).and_return(bob)
			allow(game.board).to receive(:game_over).and_return(:winner)
			expect(game.game_over_message).to eq 'bob won!'
		end

		it "returns 'The game ended in a tie if board shows a draw" do
			game = ConnectFour.new([bob,frank])
			allow(game).to receive(:current_player).and_return(bob)
			allow(game.board).to receive(:game_over).and_return(:draw)
			expect(game.game_over_message).to eq "The game ended in a tie"
		end
	end
end