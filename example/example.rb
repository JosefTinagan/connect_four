require_relative '../lib/connect_four.rb'
require_relative '../lib/player.rb'

puts "Welcome to Connect Four"
bob = Player.new({color: "blue", name: "bob"})
frank = Player.new({color: "red", name: "frank"})
players = [bob, frank]
ConnectFour.new(players).play