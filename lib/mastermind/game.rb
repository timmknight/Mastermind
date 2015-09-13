module Mastermind
	class Game
		attr_reader :player, :board
		def initialize(player, board = Board.new)
			@player = player
			@board = board
		end

		def solict_guess
			"\nPlease enter your 4 colour code: \n"
		end

		def validate_length(guess)
			if guess.length == 4
				return true
			end
			return false
		end

		def validate_correct_characters(character)
			case character
			when "R"
				return true
			when "G"
				return true
			when "B"
				return true
			when "Y"
				return true			
			when "C"
				return true
			when "S"
				return true
			when "P"
				return true
			when "W"
				return true
			else 
				return false
			end
		end

		def validate_string(guess)
			split = guess.split("")
			count = 0
			split.each do |char|
				if validate_correct_characters(char)
					count += 1
				end
				if count == 4 
					return true
				end
			end
			return false
		end
		
		def validate(guess)
			if validate_length(guess) && validate_string(guess)
				return true
			end
			puts "\nSorry the code isn't in the correct format. Remeber it needs to be 4 colours => rbgy"
			false
		end

		def get_guess(guess=gets.chomp)
			return guess.upcase
		end

		def start_game
			"Welcome to Mastermind!\n\n**********************\n\nThe computer is generating a 4 colour code that you're going to have to crack in 12 turns. \n\nYou have 8 colours to choose from: Red (r), Blue (b), Green (g), Yellow (y), Cyan (c), Steel (s), Purple (p) and White (w).\n\nEach round you will enter a 4 colour code in the format: rbgy or RBGY - if the guess isn't in the correct format you will be prompted to enter it again.\n\nEach time you take a guess you will find out how colours are in the correct postion and the correct color and how many are the correct colour but the incorrect position."
		end

		def play
			puts start_game
			while !board.game_over?
				puts "\nYou have rounds #{12 - board.get_turn} left!"
				puts solict_guess
				guess = get_guess
				if validate(guess)
					boardarr = create_color_block(guess)		
					board.show_board(boardarr)
					board.add_guess_to_board(board.get_turn, guess)
					puts "\nCorrect position and color #{board.correct_color(guess)}\n"
				end
			end
		end

		def create_color_block(guess)
			ary =  guess.split('')
			board = []
				ary.each do |num|
					color = convert_to_color(num)
					block = num*4
					colourBlock = block.colorize(:color => color, :background => color) 
					board << colourBlock
				end
			return board
		end

		def convert_to_color(char)
			case char
			when "R"
				return :red
			when "G"
				return :green
			when "B"
				return :blue
			when "Y"
				return :yellow			
			when "C"
				return :cyan
			when "S"
				return :black
			when "P"
				return :magenta
			when "W"
				return :white
			else 
				return false
			end
		end
	end
end



