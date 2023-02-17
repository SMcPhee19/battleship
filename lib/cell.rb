class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate, ship = nil)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(boat_name)
    @ship = boat_name
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if @ship.nil?
      @fired_upon = true
    else
      @ship.hit
      @fired_upon = true
    end
  end
end

