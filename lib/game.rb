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
      player_cruiser_placement
      player_sub_placement
      play_game
    elsif
      input == "q"
      puts "That's dissapointing!"
    else
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
    while @computer_board.valid_placement?(@computer_cruiser, computer_place_cruiser) == false
      computer_place_cruiser = @computer_board.valid_cruiser_placement.sample
    end 
    @computer_board.place(@computer_cruiser, computer_place_cruiser)
    computer_place_sub = @computer_board.valid_submarine_placement.sample
    while @computer_board.valid_placement?(@computer_sub, computer_place_sub) == false
      computer_place_sub = @computer_board.valid_submarine_placement.sample
    end
    @computer_board.place(@computer_sub, computer_place_sub)
  end
  
  def player_cruiser_placement
    puts "I have laid out my ships on the grid.\nYou now need to lay out your two ships.\nThe Cruiser is three units long and the\nSubmarine is two units long."
    puts @player_board.render(true)
    
    puts "Enter the squares for the Cruiser (3 spaces):"
    player_cruiser_cells = gets.chomp.upcase.split
    puts "#{player_cruiser_cells}"
    if @player_board.valid_placement?(@player_cruiser, player_cruiser_cells) == false 
      puts "Those are invalid coordinates. Please try again:"
      player_cruiser_placement
    else 
      @player_board.place(@player_cruiser, player_cruiser_cells)
      puts @player_board.render(true)
    end
  end

  def player_sub_placement
    puts "Enter the squares for the Submarine (2 spaces):"
    player_sub_cells = gets.chomp.upcase.split
    puts "#{ player_sub_cells}"
    if @player_board.valid_placement?(@player_sub, player_sub_cells) == false 
      puts "Those are invalid coordinates. Please try again:"
      player_sub_placement
    else
      @player_board.place(@player_sub, player_sub_cells)
      puts @player_board.render(true)
    end
  end

  def turn
    show_board
    while player_lost == false || computer_lost == false
      computer_shot
      player_shot
      player_results
      show_board
      break if player_lost || computer_lost
    end
  end

  def computer_shot
    @computer_shot = @player_board.cells.keys.sample
    if @player_board.valid_coordinate?(@computer_shot) == true && @player_board.cells[@computer_shot].fired_upon? == false
      @player_board.cells[@computer_shot].fire_upon
    end
  end

  def player_shot
    puts "Please enter the coordinate you wish to fire upon"
    @player_shot = gets.chomp.upcase
    if @computer_board.valid_coordinate?(@player_shot) == true && @computer_board.cells[@player_shot].fired_upon? == false
      @computer_board.cells[@player_shot].fire_upon
    else
      puts "Please enter a valid coordinate"
      player_shot
    end
  end

  def player_results
    if @computer_board.cells[@player_shot].empty?
      @computer_board.cells[@player_shot].render == "M"
      puts "Miss!"
    else @computer_board.cells[@player_shot].empty? == false
      if @computer_board.cells[@player_shot].ship.health >= 1 
        @computer_board.cells[@player_shot].render == "H"
        puts "Hit!"
      else
        @computer_board.cells[@player_shot].render == "X"
        puts "You sunk my #{@computer_board.cells[@player_shot].ship.name}!"

      end
    end
  end

  def computer_results
    if @player_board.cells[@computer_shot].empty?
      @player_board.cells[@computer_shot].render == "M"
      puts "Miss!"
    else @player_board.cells[@computer_shot].empty? == false
      if @player_board.cells[@computer_shot].ship.health >= 1
        @player_board.cells[@computer_shot].render == "H"
        puts "Hit!"
      else
        @player_board.cells[@computer_shot].render == "X"
        puts "I sunk your #{@player_board.cells[@computer_shot].ship.name}!"
      end
    end
  end

  def play_game
    while player_lost == false && computer_lost == false
      show_board
      turn
      player_shot
      computer_shot
      break if computer_lost == true || player_lost == true
    end
    if computer_lost == true
      puts "Congrats! You win!"
    else player_lost == true
      puts "You lost!"
    end
    show_board
    start_up
  end

  def show_board
    puts "=============COMPUTER BOARD============="
    puts @computer_board.render(true)#have to comment true out. This is to view computer board
    puts "==============PLAYER BOARD=============="
    puts @player_board.render(true)
  end

  def player_lost
    @player_cruiser.sunk? && @player_sub.sunk?
  end

  def computer_lost 
    @computer_cruiser.sunk? && @computer_sub.sunk?
  end
end
