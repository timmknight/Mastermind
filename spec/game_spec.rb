require "spec_helper"

module Mastermind
	describe "Game" do

  let (:bob)	{ Player.new( { name: "bob" } ) }

		context "#initialize" do
			it "selects the computer player as the first player" do
				game = Game.new(bob)
				expect(game.player.name).to eq "bob"
			end

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
				expect(game.validate_correct_characters("S")).to eq true
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


		context "#validate" do
			it "returns true for a valid guess" do
				game = Game.new(bob)
				expect(game.validate("RWBG")).to eq true
			end

			it "returns false for a invalid guess" do
				game = Game.new(bob)
				expect(game.validate("qqqq")).to eq false
			end

			it "returns false for a invalid guess" do
				game = Game.new(bob)
				expect(game.validate("qqqqqqqqq")).to eq false
			end

				it "returns false for a invalid guess" do
				game = Game.new(bob)
				expect(game.validate("!g£%")).to eq false
			end
		end
		context "#solict_guess" do
			it "gets the code from the computer_player" do
				game = Game.new(bob)
				expected = "\nPlease enter your 4 colour code: \n"
				expect(game.solict_guess).to eq expected
			end
		end

		context "#get_guess" do
			it "returns the users guess" do
				game = Game.new(bob)
				expected = "GGGG"
				expect(game.get_guess("gggg")).to eq expected
			end
		end
	end	
end