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
    input = gets.chomp
    if input == "p"
      game_setup
      computer_ship_placement
      player_ship_placement
      play_game
    elsif
      input == "q"
      puts "That's dissapointing!"
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
      break #We'll need to refactor some how find a way to get rid of the break
    end
    @computer_board.place(@computer_sub, computer_place_sub)
  end
  
  def player_ship_placement
    puts "I have laid out my ships on the grid.\nYou now need to lay out your two ships.\nThe Cruiser is three units long and the\nSubmarine is two units long."
    puts @player_board.render(true)
    
    puts "Enter the squares for the Cruiser (3 spaces):"
    player_cruiser_cells = []
    puts "#{player_cruiser_cells << gets.chomp.upcase.split}"
    if @player_board.valid_placement?(@player_cruiser, player_cruiser_cells.first) == false 
      puts "Those are invalid coordinates. Please try again:"
    end
    @player_board.place(@player_cruiser, player_cruiser_cells.first)

    print @player_board.render(true)
    
    puts "Enter the squares for the Submarine (2 spaces):"
    player_sub_cells = []
    puts "#{player_sub_cells << gets.chomp.upcase.split}"
    if @player_board.valid_placement?(@player_sub, player_sub_cells.first) == false 
      puts "Those are invalid coordinates. Please try again:"
    end
    @player_board.place(@player_sub, player_sub_cells.first)
    print @player_board.render(true)
  end

  def turn
    puts "=============COMPUTER BOARD============="
    puts @computer_board.render
    puts "==============PLAYER BOARD=============="
    puts @player_board.render(true)
    while player_lost == false || computer_lost == false
      computer_shot
      player_shot
      #do we need to display the boards?
      break if player_lost || computer_lost
      game_end
    end
  end

  def computer_shot
    #how we want computer shot to work
  end

  def player_shot
    #how we want the player shot to work
  end

  def player_lost
    @player_cruiser.sunk? && @player_sub.sunk?
  end

  def computer_lost 
    @computer_cruiser.sunk? && @computer_sub.sunk?
  end

  def game_end
    # how do we want the game to end
  end
  
end
