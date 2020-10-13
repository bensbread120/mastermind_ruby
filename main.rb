# frozen_string_literal: true

require_relative 'computer_selection.rb'
require_relative 'player_selection.rb'

# This object is created everytime the program is run, it decides which of the classes to run off
# the comp_selection class is for the player to guess the secret code
# the comp_player class is for the user to select a code and the computer to try and figure the code out
class Game
  def looping_game
    while pick_side
    end
  end

  private

  def pick_side
    puts 'would the player like to be choosing the code or breaking the code? choosing/breaking'
    get_input(gets)
    puts 'would you like to play again y/n'
    play_again = gets
    if play_again.nil?
      false
    else
      (play_again.chomp.downcase == 'y')
    end
  end

  def get_input(input)
    if input.nil?
      get_input(gets)
    elsif input.chomp.downcase == 'breaking'
      create_comp_class
    elsif input.chomp.downcase == 'choosing'
      create_player_class
    else
      get_input(gets)
    end
  end

  def create_comp_class
    chosen_result = ComputerSelection.new
    chosen_result.loop_turns
  end

  def create_player_class
    puts 'please enter your code:'
    chosen_result = PlayerSelection.new(get_code(gets))
    chosen_result.loop_turns
  end

  def get_code(number)
    number.nil? ? get_code(gets) : number.chomp.to_s
  end
end

new_game = Game.new

new_game.looping_game
