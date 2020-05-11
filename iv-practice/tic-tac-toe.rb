# To-Do:
#   - create TicTacToe class, initialized with empty array of 9 strings w/ space
#   - create array with win combinations 
#   - create method that displays the game board to be used throughout class as board status changes
#   - method needs to be made to prompt user to choose the position they'd like to play
#     - this method needs to call other methods to make sure the move is valid and update game board
#   - method to check if position is taken
#   - method to check if user input is a valid move/position between 1 and 9
#   - need method to convert user input from string to integer to index (+1)
#   - have method that counts # of turns taken
#   - have method that determines what players turn it is using turns taken method
#   - method to update board with valid move
#   - method that checks if game board is full
#   - method that determines if game is a draw
#   - method that determines if game is over
#   - method that determines if game has been won
#   - method that checks if the board meets any win combinations criteria
#   - method to determine which player won
#   - method that plays the game

class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end 

  WIN_COMBINATIONS = [
    [0, 1, 2], # top row
    [3, 4, 5], # middle row
    [6, 7, 8], # bottom row
    [0, 3, 6], # left column
    [1, 4, 7], # center column
    [2, 5, 8], # right column
    [0, 4, 8], # diagonal left --> right
    [2, 4, 6] # diagonal right --> left
  ]

  # prints out board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # converts input from str to int --> index
  def convert_input(input)
    input.to_i - 1 # turns input into int of correct index
  end

  # update board position with token to complete move
  def complete_move(position, token="x")
    @board[position] = token
  end 

  # check if spot on board is taken
  def position_taken?(index)
    @board[index] == "x" || @board[index] == "o"
  end 

  # checks if move is valid
  def valid_move?(input)
    input.between?(0, 8) && !position_taken?(input)
  end

  # takes input from user and takes turn if valid 
  def take_turn
    puts "Choose the move you'd like to make by entering a number between 1 and 9"

    move = convert_input(gets.chomp)
    
    if valid_move?(move)
      complete_move(move, current_player)
    else 
      puts "Sorry that move was invalid, please try again"
      take_turn
    end
    display_board
  end 

  # keeps count of the number of turns taken
  def num_of_turns
    @board.count { |spot| spot === "x" || spot === "o" }
  end 

  # determines which players turn it is
  def current_player
    player = nil
    num_of_turns % 2 == 0 ? player = 'x' : player = 'o'
    
    return player
  end

  # Game Status methods
  def game_won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])
    end
  end

  def board_full? 
    num_of_turns == 9 
  end

  def draw?
    !game_won? && board_full?
  end 

  def over? 
    game_won? || board_full? || draw?
  end 

  def winner
    return @board[game_won?[0]] if game_won? 
  end

  # Play the game
  def play_game
    until over?
      take_turn
    end 

    if game_won?
      puts "Congratulations #{winner}"
    elsif draw?
      puts "Tie Game!"
    end
  end 
end 

my_game = TicTacToe.new
my_game.play_game
