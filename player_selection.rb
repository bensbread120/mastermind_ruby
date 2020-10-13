# frozen_string_literal: true

require_relative 'computer_selection.rb'

# Uses many of the methods from the computer selction class but allows the somp to provide guesses with some basic logic
class PlayerSelection < ComputerSelection
  attr_reader :secret_code
  def initialize(secret_code)
    @secret_code = secret_code
    @guesses = 12
    @comp_first_guess = secret_code.length.times.map { rand(6).to_s }
  end

  def loop_turns
    current_guess = @comp_first_guess
    while @guesses >= 0
      puts "please enter a #{CODE_LENGTH} digit code:"
      print current_guess.join + ' => '
      @guesses -= 1
      break unless check_input(current_guess)

      current_guess = new_comp_guess(current_guess)
    end
  end

  private

  def new_comp_guess(old_guess)
    new_guess = []
    old_guess.each_with_index do |win_val, index|
      new_guess[index] = if win_val == @secret_code[index]
                           old_guess[index]
                         else
                           rand(6).to_s
                         end
    end
    new_guess
  end
end
