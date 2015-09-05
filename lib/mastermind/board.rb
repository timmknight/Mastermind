module Mastermind
	class Board
		attr_reader :grid, :code, :turn#, :guess#, :current_row

		def initialize(input = {})
			@grid = input.fetch(:grid, make_grid)
			# @current_turn = 0
			# @current_row = @current_turn
			# @current_row_code = grid[@current_row]
			@code = computers_code
			# @guess = get_guess
			@turn = 0
		end

		def get_turn
			return @turn
		end

		# def set_code(current_row, value)
		# 	grid[current_row] = value
		# end

		def add_guess_to_board(turn, value)
			grid[turn] = value
			increment_turn
		end
		
		def increment_turn
			# puts "increment = #{@turn}"
			return @turn += 1
		end

		def show_board
			print "#{grid[get_turn-1][0]} | #{grid[get_turn-1][1]} | #{grid[get_turn-1][2]} | #{grid[get_turn-1][3]}" 
			print ""
			return grid
			# puts "show_board"
		end

		def game_over?
			# puts ""
			# puts code
			# puts get_guess(1234)
			return true if code_guessed_correctly?
			# print correct_postion
			return true if code_not_guessed

			# return true if code_not_guessed

			# return false if !code_guessed_correctly?
			false
		end


		def correct_postion(guess)
			str = guess.to_s
			guessarr = str.split('')
			count = 0
			res = []
			ary = []
			4.times do |n|
				# puts "n = #{n}"
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
				#puts num
				arr << colours[num-1]
			end
			code = arr.join('')
			puts code
			return code
		end

		def code_not_guessed
			if(get_turn == 12 )
				puts "computer wins!"
				return true
			end
			false
		end

		def code_guessed_correctly?
			if code == grid[get_turn-1]
				puts "winner!"
				return true
			end
			false
		end	
		
	end
end