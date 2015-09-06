module Mastermind
	class Board
		attr_reader :grid, :code, :turn

		def initialize(input = {})
			@grid = input.fetch(:grid, make_grid)
			@code = computers_code
			@turn = 0
		end

		def get_turn
			return @turn
		end

		def add_guess_to_board(turn, value)
			grid[turn] = value
			increment_turn
		end
		
		def increment_turn
			return @turn += 1
		end

		def show_board(ary)
			print "\n#{ary[0]} | #{ary[1]} | #{ary[2]} | #{ary[3]} \n"
		end

		def showcolor 
			# print ary[0]
		end
		def game_over?
			return true if code_guessed_correctly?
			return true if code_not_guessed
			false
		end


		def correct_postion(guess)
			guessarr = guess.to_s.split('')
			count = 0
			res = []
			ary = []
			4.times do |n|
					res << code[n]
				if code[n] == guessarr[n]
					count += 1
					res.pop
				else 
					ary << guessarr[n]
				end
			end
					puts "\nCorrect colour but not position: #{correct_number(res, ary, count)}"
			return count
		end

		def correct_number(res, ary, count)
			ary.each do |char|
				if res.include?(char)
					del = res.index(char)
					res.delete_at(del)
				end
			end
			result = 4 - res.count - count
			return result
		end

########PRIVATE METHODS############
		# private

		def make_grid
		 	Array.new(12) { [] }
		end

		def computers_code
			arr = []
			colours = ["R", "B", "G", "Y", "S", "P", "W", "C"]
			4.times do 
				num = rand(1..8)
				arr << colours[num-1]
			end
			code = arr.join('')
			puts code
			return code
		end

		def code_not_guessed
			if(get_turn == 12 )
				puts "Computer Wins! You didn't guess the code."
				return true
			end
			false
		end

		def code_guessed_correctly?
			if code == grid[get_turn-1]
				puts "You won!!"
				return true
			end
			false
		end	
		
	end
end