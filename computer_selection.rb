# frozen_string_literal: true

# This object creates a secret code and prompts the user to guess the code
class ComputerSelection
  CODE_LENGTH = 4
  FEEDBACK = %w[_ X O].freeze
  WIN_ARRAY = Array.new(CODE_LENGTH, 'X')
  attr_accessor :guesses
  attr_reader :secret_code
  def initialize
    @secret_code = CODE_LENGTH.times.map { rand(6).to_s }
    @guesses = 12
  end

  def loop_turns
    while @guesses >= 0
      print "please enter a #{CODE_LENGTH} digit code:"
      @guesses -= 1
      check_input(get_input(gets)) ? next : break
    end
  end

  private

  def compare_code_to_input(guess)
    return_array = []
    (0..CODE_LENGTH - 1).each do |code_digit|
      return_array[code_digit] = provide_feedback(guess, code_digit)
    end
    p return_array
    return_array
  end

  def check_input(input)
    if compare_code_to_input(input) == WIN_ARRAY
      puts "nice work you won with #{@guesses} guesses left"
      false
    elsif @guesses.zero?
      puts "better luck next time, the code was: #{print_code}"
      false
    else
      puts "keep trying you've got #{@guesses} guesses left"
      true
    end
  end

  def get_input(input)
    input.nil? ? get_input(gets) : input.chomp.split('')
  end

  def provide_feedback(guess, code_digit)
    if guess[code_digit] == @secret_code[code_digit]
      FEEDBACK[1]
    elsif @secret_code.include?(guess[code_digit])
      FEEDBACK[2]
    else
      FEEDBACK[0]
    end
  end

  def print_code
    p @secret_code
  end
end
