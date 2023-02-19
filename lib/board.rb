class Board
  attr_reader :cells

  def initialize
    @cells = {
      "A1" => Cell.new('A1'),
      "A2" => Cell.new('A2'),
      "A3" => Cell.new('A3'),
      "A4" => Cell.new('A4'),
      "B1" => Cell.new('B1'),
      "B2" => Cell.new('B2'),
      "B3" => Cell.new('B3'),
      "B4" => Cell.new('B4'),
      "C1" => Cell.new('C1'),
      "C2" => Cell.new('C2'),
      "C3" => Cell.new('C3'),
      "C4" => Cell.new('C4'),
      "D1" => Cell.new('D1'),
      "D2" => Cell.new('D2'),
      "D3" => Cell.new('D3'),
      "D4" => Cell.new('D4')
    }
  
  end

  def valid_coordinate?(coordinate)
    return true if @cells.include?(coordinate)
    false
  end

  def valid_placement?(ship, coordinate_array)
    if ship.length == coordinate_array.length
      if ships_arent_overlapping(coordinate_array)
        valid_cruiser_placement.include?(coordinate_array) || valid_submarine_placement.include?(coordinate_array)
      else 
        false
      end
    else
      false
    end
  end

  def place(ship, coordinate_array)
    coordinate_array.each do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end

  def ships_arent_overlapping(coordinate_array)
    coordinate_array.all? do |coordinate|
      @cells[coordinate].empty? 
    end
  end

  def valid_cruiser_placement
    valid_cruiser_spots = [
      %w(A1 B1 C1),
      %w(B1 C1 D1),
      %w(A2 B2 C2),
      %w(B2 C2 D2),
      %w(A3 B3 C3),
      %w(B3 C3 D3),
      %w(A4 B4 C4),
      %w(B4 C4 D4),
      %w(A1 A2 A3),
      %w(B1 B2 B3),
      %w(C1 C2 C3),
      %w(D1 D2 D3),
      %w(A2 A3 A4),
      %w(B2 B3 B4),
      %w(C2 C3 C4),
      %w(D2 D3 D4)
    ]
  end
  

  def valid_submarine_placement #write tests
    valid_sub_spots = [
      %w(A1 A2),
      %w(B1 B2),
      %w(C1 C2),
      %w(D1 D2),
      %w(A2 A3),
      %w(B2 B3),
      %w(C2 C3),
      %w(D2 D3),
      %w(A3 A4),
      %w(B3 B4),
      %w(C3 C4),
      %w(D3 D4),
      %w(A1 B1),
      %w(B1 C1),
      %w(C1 D1),
      %w(A2 B2),
      %w(B2 C2),
      %w(C2 D2),
      %w(A3 B3),
      %w(B3 C3),
      %w(C3 B3),
      %w(A4 B4),
      %w(B4 C4),
      %w(C4 D4)
    ]
  end
end