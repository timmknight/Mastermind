require "spec_helper"

module Mastermind

	describe Player do
	  
	
		context "initializes" do
			it "raise an error when no player_name is given" do
				expect{Player.new({})}.to raise_error(KeyError)
			end

			it "does not raise an error when initialized with a player_name" do
				input = { name: "bob" }
				expect{ Player.new( input ) }.to_not raise_error
			end

			it "assigns the player_name to equal the input" do
				input = { name: "bob" }
				player = Player.new(input)
				expect(player.name).to eq "bob"
			end

		end

	end
end