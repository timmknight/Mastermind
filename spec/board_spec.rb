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

			# it "should have 4 columns in each row by defualt" do
			# 	board = Board.new()
			# 	board.grid.each do |row|
			# 		expect(row.size).to eq(4)
			# 	end
			# end

			# it "should set the current turn to 0" do
			# 	board = Board.new()
			# 	expect(board.current_turn).to eq 0
			# end

			# it "set the current_row as 0" do
			# 	board = Board.new()
			# 	expect(board.current_row).to eq 0
			# end

			

		end

		context "#add_guess_to_board" do
			it "adds the users guess to the grid" do
				board = Board.new()
				expected = "rrrr"
				board.add_guess_to_board(0, "rrrr")
				expect(board.grid[0]).to eq expected
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
		context "show_board" do
			it "should display the board" do
				board = Board.new()
				board.add_guess_to_board(0, "rrrr")
				expected = ["rrrr", [], [], [], [], [], [], [], [], [], [], []]
				expect(board.show_board).to eq expected
			end
		end
		# context "#add_guess_to_board" do
		# 	it "should add the get_guess code to the board" do
		# 		board = Board.new()
		# 		guess = board.get_guess(1231)
		# 		board.add_guess_to_board(5, guess)
		# 		expect(board.grid[5]).to eq 1231
		# 	end

		# 		it "should add 1 to the current_turn" do
		# 		board = Board.new()
		# 		board.add_guess_to_board(5, 1231)
		# 		expect(board.current_turn).to eq 6
		# 	end
		# end

		context "#grid" do
		
			it "returns the grid" do
				board = Board.new(grid: "test")
				expect(board.grid).to eq "test"
			end

		end

		context "#game_over?" do
		
			# it "returns true if the guess = the code" do
			# 	board = Board.new()

			# 	board.grid[0] = "rrrr"
			# 	board.increment_turn
			# 	expect(board.game_over?).to eq true
			# end

			it "returns false if the guess != the code" do
				board = Board.new()
				board.grid[0] = "rbor"
				expect(board.game_over?).to eq false
			end

		end



		context "#correct_postion" do
		
			it "returns the number of correct colours in a guess" do
				board = Board.new()
				board.grid[0] = "bbbb"
				expected = 1
				expect(board.correct_postion).to eq expected
			end
		end
		# context "#code_guessed_correctly?" do
		
		# 	it "returns true if code == guess" do			
		# 		board = Board.new()
		# 		@guess = 1234
		# 		board.code_guessed_correctly?
		# 		expect(board.code_guessed_correctly?).to eq true
		# 	end

		# end

		

			# it "returns the add 1 to the current_turn" do
			# 	board = Board.new()
			# 	board.get_guess(1111)
			# 	expected = 1
			# 	expect(board.current_turn).to eq expected
			# 	# expect(game.turn).to eq 1
			# end
		

	end
end









