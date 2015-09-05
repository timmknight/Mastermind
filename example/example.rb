# /example/example_game.rb
require_relative "../lib/mastermind.rb"
 
puts "Welcome to mastermind"
# bob = Mastermind::Player.new({name: "bob"})
Mastermind::Game.new({name: "bob"}).play