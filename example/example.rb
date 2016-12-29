require_relative '../lib/connect_four.rb'
require_relative '../lib/player.rb'
require_relative '../lib/board.rb'
require_relative '../lib/cell.rb'
require_relative '../lib/core_extensions.rb'

puts "Welcome to Connect Four"
bob = Player.new({color: "X", name: "bob"})
frank = Player.new({color: "Y", name: "frank"})
players = [bob, frank]
ConnectFour.new(players).play