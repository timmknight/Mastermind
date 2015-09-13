# /example/example_game.rb
require_relative "../lib/mastermind.rb"
puts "To start a game of Mastermind please enter your name:"
Mastermind::Game.new({name: gets.chomp}).play