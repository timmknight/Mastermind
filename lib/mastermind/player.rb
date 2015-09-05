module Mastermind
	
	class Player

		attr_accessor :name

		def initialize(input)
			@name = input.fetch(:name)
		end
		
	end

end