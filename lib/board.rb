class Board
	attr_reader :grid
	def initialize(input = {})
		@grid = input.fetch(:grid, default_grid)
	end

	def get_cell(x,y)
		grid[y][x]
	end

	def set_cell(x,y,value)
		get_cell(x,y).value = value
	end

	def show_grid
		grid.each do |row|
			puts row.map { |cell| cell.value.empty? ? "_" : cell.value }.join(" ")
		end
	end

	def game_over
		return :winner if winner?
		return :draw if draw?
		false
	end

	private

	def winner?
		winning_positions.each do | winning_position |
			next if winning_position_values(winning_position).all_empty?
			return true if winning_position_values(winning_position).all_same?
		end
		false
	end

	def draw?
		grid.flatten.map{|cell| cell.value }.none_empty?
	end

	def winning_positions
		winning_rows + winning_columns + winning_diagonals
	end

	def winning_rows
		[
			[get_cell(0,5), get_cell(1,5), get_cell(2,5), get_cell(3,5)],
			[get_cell(1,5), get_cell(2,5), get_cell(3,5), get_cell(4,5)],
			[get_cell(2,5), get_cell(3,5), get_cell(4,5), get_cell(5,5)],
			[get_cell(3,5), get_cell(4,5), get_cell(5,5), get_cell(6,5)],
		]
	end

	def winning_columns
		[
			[get_cell(0,5), get_cell(0,4), get_cell(0,3), get_cell(0,2)]
		]
	end

	def winning_diagonals
		[
			[get_cell(0,5), get_cell(1,4), get_cell(2,3), get_cell(3,2)]
		]
	end

	def default_grid
		Array.new(6){ Array.new(7){ Cell.new}}
	end

	def winning_position_values(winning_position)
		winning_position.map { |cell| cell.value }
	end
end