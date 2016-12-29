class ConnectFour
	attr_reader :players, :board, :current_player, :other_player
	def initialize(players, board = Board.new)
		@players = players
		@board = board
		@current_player, @other_player = players.shuffle
	end

	def switch_players
		@current_player, @other_player = other_player, current_player
	end

	def solicit_move
		"#{current_player.name}: Enter a number between 1 and 7(columns) to make your move"
	end

	def get_move(human_move = gets.chomp)
		human_move_to_coordinates(human_move)
	end

	def game_over_message
		return "#{current_player.name} won!" if board.game_over == :winner
		return "The game ended in a tie" if board.game_over == :draw
	end

	def play
		puts "#{current_player.name} has randomly been selected as the first player"
		while true
			board.show_grid
			puts solicit_move
			x,y = get_move
			board.set_cell(x, y, current_player.color)
			if board.game_over
				puts game_over_message
				board.show_grid
				return
			else
				switch_players
			end
		end
	end

	private

	def human_move_to_coordinates(human_move)
		mapping = {
			"1" => [5, 0],
			"2" => [5, 1],
			"3" => [5, 2],
			"4" => [5, 3],
			"5" => [5, 4],
			"6" => [5, 5],
			"7" => [5, 6]
		}
		check_coordinate = mapping[human_move]
		x,y = check_coordinate
		while !board.get_cell(x,y).value.empty?
			x -= 1
		end
		tmp = [x,y]
	end
end