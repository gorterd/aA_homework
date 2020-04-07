class Board
	attr_accessor :cups

	def initialize(name1, name2)
		@name1 = name1
		@name2 = name2
		@cups = Array.new(14) {|i| [6,13].include?(i) ? [] : [:stone] * 4 }
	end

	# def place_stones
	# 	# helper method to #initialize every non-store cup with four stones each
	# end

	def valid_move?(start_pos)
		unless (0..5).include?(start_pos) || (7..12).include?(start_pos) 
			raise ArgumentError.new("Invalid starting cup") 
		end
		
		if cups[start_pos].empty?
			raise ArgumentError.new("Starting cup is empty") 
		end
	end

	def make_move(start_pos, current_player_name)
		stones = cups[start_pos].size
		cups[start_pos].clear

		oppo_cup_idx = current_player_name == name1 ? 13 : 6

		cur_pos = start_pos
		until stones == 0
			cur_pos = increment(cur_pos, oppo_cup_idx)
			cups[cur_pos] << :stone 
			stones -= 1
		end

		render
		next_turn(cur_pos)
	end

	def render
		print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
		puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
		print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
		puts ""
		puts ""
	end

	def one_side_empty?
		cups[0..5].all?(&:empty?) || cups[7..12].all?(&:empty?) 
	end

	def winner
		end_state = cups[6].size <=> cups[13].size

		if end_state == 0
			:draw
		else
			end_state > 0 ? name1 : name2
		end
	end

	private

	attr_reader :name1, :name2

	def next_turn(ending_cup_idx)
		return :prompt if [6,13].include?(ending_cup_idx)
		return :switch if cups[ending_cup_idx].size == 1

		ending_cup_idx
	end

	def increment(pos, oppo_idx)
		pos += 1
		pos += 1 if pos == oppo_idx
		pos = 0 if pos > 13

		pos
	end
end
