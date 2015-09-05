require "spec_helper"

module Mastermind
	describe "Game" do

  let (:bob)	{ Player.new( { name: "bob" } ) }
 	# let (:computer)	{ Player.new( { player_name: "computer" } ) }

		context "#initialize" do
			it "selects the computer player as the first player" do
				game = Game.new(bob)
				expect(game.player.name).to eq "bob"
			end

			# it "expects the turn to equal 0" do
			# 	game = Game.new(bob)
			# 	expect(game.turn).to eq 0
			# end
		end

		context "#validate_length" do
			it "returns true for a guess of 4 characters" do
				game = Game.new(bob)
				guess = game.get_guess("aaaa")
				expect(game.validate_length(guess)).to eq true
			end

			it "returns false for a guess of less than 4 characters" do
				game = Game.new(bob)
				guess = game.get_guess("aa")
				expect(game.validate_length(guess)).to eq false
			end

			it "returns false for a guess of more than 4 characters" do
				game = Game.new(bob)
				guess = game.get_guess("aaaaaaa")
				expect(game.validate_length(guess)).to eq false
			end
		end


	context "#validate_correct_characters" do
			it "returns true for each character that the guess can contain (R, G, B, Y, C, O, P, W)" do
				game = Game.new(bob)
				expect(game.validate_correct_characters("R")).to eq true
				expect(game.validate_correct_characters("G")).to eq true
				expect(game.validate_correct_characters("B")).to eq true
				expect(game.validate_correct_characters("Y")).to eq true
				expect(game.validate_correct_characters("C")).to eq true
				expect(game.validate_correct_characters("O")).to eq true
				expect(game.validate_correct_characters("P")).to eq true
				expect(game.validate_correct_characters("W")).to eq true
			end

			it "returns false for an invalid character" do
				game = Game.new(bob)
				expect(game.validate_correct_characters("1")).to eq false
				expect(game.validate_correct_characters("*")).to eq false
				expect(game.validate_correct_characters("T")).to eq false
				expect(game.validate_correct_characters(";")).to eq false
				expect(game.validate_correct_characters("+")).to eq false
			end
			
		end

		context "#validate_string" do
			it "should return true if all characters are valid" do
				game = Game.new(bob)
				guess = game.get_guess("RRRR")
				expect(game.validate_string(guess)).to eq true
			end

			it "should return false if one character is invalid" do
				game = Game.new(bob)
				guess = game.get_guess("RRRa")
				expect(game.validate_string(guess)).to eq false
				guess = game.get_guess("RRR!")
				expect(game.validate_string(guess)).to eq false
				guess = game.get_guess("VRRa")
				expect(game.validate_string(guess)).to eq false
				guess = game.get_guess("R Ra")
				expect(game.validate_string(guess)).to eq false
			end
		end

		context "#solict_guess" do
			it "gets the code from the computer_player" do
				game = Game.new(bob)
				expected = "Please enter your guess"
				expect(game.solict_guess).to eq expected
			end
		end



		context "#convert_guess_to_numbers" do
			it "should convert each letter in the guess to the corresponding number" do
				game = Game.new(bob)
				expected = 1111
				guess = game.get_guess("RRRR")
				expect(game.convert_guess_to_numbers(guess)).to eq 1111
			end
		end


		context "#get_guess" do
			it "returns the users guess" do
				game = Game.new(bob)
				expected = "GGGG"
				expect(game.get_guess("gggg")).to eq expected
				# expect(game.turn).to eq 1
			end
		end
	


		# context "#game_over" do
		
		# 	it "checks to see if the code guess is correct" do			
		# 		game = Game.new(bob)
		# 		expect(game).to receive(:winner?) { true }
		# 		expect(game.game_over).to eq :winner
		# 	end

		# 	it " returns :winner when get_guess is the same as code" do			
		# 		game = Game.new(bob)
		# 		game.get_guess(1111)
		# 		expect(game.game_over).to eq :winner
		# 	end

		# end
	end
		# context "#computers_code" do
		# 	it "gets the code from the computer_player" do
		# 		game = Game.new( [computer, bob] )
		# 		expected = [1,1,1,1]
		# 		expect(game.computers_code([1,1,1,1])).to eq expected
		# 	end
		# end

		# context "#code_guess" do
		# 	it "gets the code guess from the player" do
		# 		game = Game.new( [computer, bob] )
		# 		expected = [2,3,1,5]
		# 		expect(game.code_guess([2,3,1,5])).to eq expected
		# 	end
		# end

		# context "#current_turn" do
		# 	it "gets the current turn" do
		# 		game = Game.new( [computer, bob] )
		# 		expected = [2,3,1,5]
		# 		expect(game.code_guess([2,3,1,5])).to eq expected
		# 	end
		# end

		# context "#add_code_to_array" do
		# 	it "adds the computers_code to the first row in the array" do
		# 		game = Game.new( [computer, bob] )
		# 		expected = [1,1,1,1]
		# 		expect(game.game.current_row.value).to eq expected
		# 	end
		# end

		# context "#get_current_row" do
		# 	it "gets the first row when the game starts" do
		# 		game = Game.new([computer, bob])
		# 		expect(game.get_current_row).to eq [0,0] 
		# 	end
		# end

		# context "#get_code" do
		# 	it "gets the players code of rrrr" do
		# 		game = Game.new([computer, bob])
		# 		expect(game.get_code(rrrr)).to 
		# 	end
		# end

	
end