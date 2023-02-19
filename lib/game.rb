class Game
  attr_reader :computer_board,
              :computer_sub,
              :computer_cruiser,
              :player_board,
              :player_sub,
              :player_cruiser

  def initialize
    @computer_board = nil
    @computer_sub = nil
    @computer_cruiser = nil
    @player_board = nil
    @player_sub = nil
    @player_cruiser = nil
  end

  def start_up
    puts "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
    user_input = gets.chomp
    if user_input == "p"
      game_setup
      computer_setup
      player_setup
      play_game
    elsif
      user_input == "q"
      puts "That's dissapointing!"
    else
      puts "Read the directions, p or q"
      start_up
    end
  end

  def game_setup
    @computer_board = Board.new
    @computer_sub = Ship.new('Submarine', 2)
    @computer_cruiser = Ship.new('Cruiser', 3)
    @player_board = Board.new
    @player_sub = Ship.new('Submarine', 2)
    @player_cruiser = Ship.new('Cruiser', 3)
  end

  def computer_ship_placement
    computer_place_cruiser = @computer_board.valid_cruiser_placement.sample
    @computer_board.place(@computer_cruiser, computer_place_cruiser)
    computer_place_sub = @computer_board.valid_submarine_placement.sample
    @computer_board.place(@computer_sub, computer_place_sub)
    while @computer_board.valid_placement?(@computer_sub, computer_place_sub) == false
    end
    @computer_board.place(@computer_sub, computer_place_sub)
  end

  
end
