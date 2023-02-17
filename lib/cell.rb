class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate, ship = nil, fired_upon = false)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = fired_upon
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

  def render(show = false)
    if ship_present?
      if @ship.sunk?
        "X"
      elsif ship_was_hit(show)
        "H"
      elsif show
        "S"
      else
        "."
      end
    elsif @fired_upon == false
      "."
    elsif @fired_upon == true && @ship.nil?
      "M"
    end
  end

  def ship_present?
    !@ship.nil?
  end

  def ship_was_hit(show)
    (show && @fired_upon) || @fired_upon
  end
end

