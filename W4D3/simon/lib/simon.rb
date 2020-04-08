require "byebug"

class Simon
  COLORS = %w(red blue green yellow)

  SUCCESS_MSGS = [
    "You nailed it!",
    "Well done!",
    "Nice!",
    "Awesome!",
    "Good job!",
    "Way to go!",
    "Ayyyyy",
    "Heck yeah!"
  ]

  ADVANCED_MSGS = [
    "Damn, you cheating or something?",
    "You live to see another round",
    "Umm, this is just unfair",
    "Holy $%@#, you've done it again",
    "I'm jealous of your skills, NGL",
    "Have you considered a Simon Twitch stream?"
  ]

  attr_accessor :game_over, :seq, :sequence_length

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until self.game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless game_over
        round_success_message
        self.sequence_length += 1
    end
  end

  def show_sequence
    focus_message("Get Ready!", 1)
    add_random_color

    seq.each {|col| focus_message(col.upcase, 1) }
  end

  def require_sequence
    # user_seq = []

    # seq.each do |correct_col|
    #   system("clear")
    #   print "Your Sequence: "
    #   user_seq.each {|user_col| print "#{user_col.upcase} "}
    #   puts "\n\nNext Color: "
    #   next_guess = gets.chomp
    #   user_seq << next_guess
    #   unless next_guess.downcase == correct_col
    #     self.game_over = true
    #     return
    #   end
    # end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    msg = self.sequence_length < 20 ?  SUCCESS_MSGS.sample : ADVANCED_MSGS.sample
    focus_message(msg, 1.5)
  end

  def game_over_message
    puts "\n\nSorry, wrong guess :("
    sleep(2)
    system("clear")
    puts "Your score: #{self.sequence_length - 1}"
  end

  def reset_game
    puts "Play again? y/n"
    input = gets.chomp.downcase
    if input == "y"
      self.sequence_length = 1
      seq = []
      @game_over = false
      play
    else
      puts "Ok, thanks for playing!"
    end
  end

  private

  def focus_message(msg, time)
    system("clear")
    puts msg
    sleep(time)
    system("clear")
    sleep(1)
  end
end

if __FILE__ == $PROGRAM_NAME
  g = Simon.new
  g.play
end