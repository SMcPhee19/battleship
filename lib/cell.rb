class Cell
  attr_reader :coordinate,
              :ship,
              :cell
  def initialize(coordinate, ship = nil, cell = true)
    @coordinate = coordinate
    @ship = ship
    @cell = cell 
  end

  def empty?
    return true if @ship.nil?
    false
  end

  def place_ship(boat_name)
    @ship = boat_name
  end
end