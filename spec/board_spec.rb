require "spec_helper"

module Mastermind
	describe Board do
		
		context "#initialize" do
			
			it "initializes the board with a grid" do
				expect { Board.new() }.to_not raise_error
			end

			it "should have 12 rows by default" do
				board = Board.new()
				expect(board.grid.size).to eq(12)
			end

			it "turn should = 0" do
				board = Board.new()
				expect(board.get_turn).to eq 0
			end

			it "should generate a code 4 characters long" do
				board = Board.new()
				expect(board.computers_code.length).to eq 4
			end

		end

		context "#get_turn" do

			it "returns the turn value" do
				board = Board.new()
				expected = 1
				board.add_guess_to_board(0, "rrrr")
				board.get_turn
				expect(board.get_turn).to eq expected
			end

		end

		context "#add_guess_to_board" do

			it "adds the users guess to the grid" do
				board = Board.new()
				expected = "rrrr"
				board.add_guess_to_board(0, "rrrr")
				expect(board.grid[0]).to eq expected
			end

			# Increment turn
			it "increments the turn by 1 each time" do
				board = Board.new()
				board.add_guess_to_board(0, "rrrr")
				board.add_guess_to_board(1, "rrrr")
				board.add_guess_to_board(2, "rrrr")
				expect(board.get_turn).to eq 3
			end
		end

		context "#grid" do
		
			it "returns the grid" do
				board = Board.new(grid: "test")
				expect(board.grid).to eq "test"
			end

		end

		context "#game_over?" do
		
			# it "returns true if the guess = the code" do
			# 	board = Board.new()
			# 	guess = "rrrr"
			# 	# have to hard code the code in computer_code
			# 	board.add_guess_to_board(0, guess)
			# 	expect(board.code_guessed_correctly?).to eq true
			# end

			it "returns false if the guess != the code" do
				board = Board.new()
				board.grid[0] = "rbor"
				expect(board.game_over?).to eq false
			end
		end
	end
end









