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

  def render(view = false)
    if view
      "  1 2 3 4 \nA #{@cells["A1"].render(true)} #{@cells["A2"].render(true)} #{@cells["A3"].render(true)} #{@cells["A4"].render(true)}" +
      " \nB #{@cells["B1"].render(true)} #{@cells["B2"].render(true)} #{@cells["B3"].render(true)} #{@cells["B4"].render(true)}" +
      " \nC #{@cells["C1"].render(true)} #{@cells["C2"].render(true)} #{@cells["C3"].render(true)} #{@cells["C4"].render(true)}" +
      " \nD #{@cells["D1"].render(true)} #{@cells["D2"].render(true)} #{@cells["D3"].render(true)} #{@cells["D4"].render(true)}"
    else
      "  1 2 3 4 \nA #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render}" +
      " \nB #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render}" +
      " \nC #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render}" +
      " \nD #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render}" 
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

  def valid_submarine_placement
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