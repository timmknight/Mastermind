module Mastermind
	class Game
		attr_reader :player, :board#, :turn
		def initialize(player, board = Board.new)
			@player = player
			@board = board

			# @turn = 0
			# @guess = get_guess
		end

		def solict_guess
			"Please enter your guess"
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
			false
		end

		def get_guess(guess=gets.chomp)
			return guess.upcase
		end

		def start_game
			puts solict_guess

		end


		def convert_guess_to_numbers(guess)
			split = guess.split("")
			arr = []
			split.each do |char|
					char = case_validate_correct_characters(char)
					arr.push(char)
			end
			return arr.join().to_i
		end

		def validate_num(guess)
			if guess.between?(1111, 8888)
				return true
			end
			return false
		end


		def case_validate_correct_characters(character)
			case character
			when "R"
				return 1
			when "G"
				return 2
			when "B"
				return 3
			when "Y"
				return 4			
			when "C"
				return 5
			when "S"
				return 6
			when "P"
				return 7
			when "W"
				return 8
			else 
				return false
			end
		end

		def play
			# puts "code = #{board.master_code}"

			# puts solict_guess
			# puts "outside"
				# guess = get_guess
				# board.add_guess_to_board(@turn, guess)
			while !board.game_over?
				puts "\n\n"
				puts solict_guess

				guess = get_guess
				
			num =	convert_guess_to_numbers(guess)
				if validate_num(num)
					# puts "turn = #{board.get_turn}, guess = #{guess}"

					boardarr = test(guess)
					puts "guess = #{guess}"
					
					
					board.add_guess_to_board(board.get_turn, boardarr)
					board.show_board
							board.add_guess_to_board(board.get_turn, guess)
							puts "Correct position and color #{board.correct_postion(guess)}"
							# puts board.correct_number(guess)
				#else
				# 	puts solict_guess

				# guess = get_guess
				 # test(guess)
			end
			
				# @turn = @turn+1
				# print "board = #{board.show_board}"
			end
		end

		def test(guess)
			# puts guess
			ary =  guess.split('')

			board = []
				ary.each do |num|
					# puts "num = #{num}"
					color = convert_to_color(num)
					ggg = num*4
								aaa = ggg.colorize(:color => color, :background => color) 
					# 4.times { aaa << ary[num]  }
					board << aaa
					 	# puts aaa
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


# def a
# 	puts ["|" + "RED ".colorize(:blue).on_blue + "|" + "blue ".colorize(:blue).on_blue + "|" + "RED ".colorize(:red).on_red + "|" +"RED ".colorize(:red).on_red + "|"]

# 	puts ["|" + "RED ".colorize(:red).on_red + "|" + "RED ".colorize(:red).on_red + "|" + "RED ".colorize(:red).on_red + "|" +"RED ".colorize(:red).on_red + "|"]
# end
	end
end
# game = Game.new({name: 'bob'})
# game.play


