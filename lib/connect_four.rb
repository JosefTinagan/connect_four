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
		"#{current_player.name}: Enter a number between 0 and 6(columns) to make your move"
	end

	def get_move(human_move = gets.chomp)
		human_move_to_coordinates(human_move)
	end

	def game_over_message
		return "#{current_player.name} won!" if board.game_over == :winner
		return "The game ended in a tie" if board.game_over == :draw
	end

	private

	def human_move_to_coordinates(human_move)
		mapping = {
			"0" => [5, 0]
		}
		mapping[human_move]
	end
end