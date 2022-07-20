require './lib/ship'

class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if @ship != nil
      @ship.hit
    end
    @fired_upon = true
  end

  def render(show_ship = false)
    if @fired_upon == true && @ship == nil
      "M"
    elsif @fired_upon == true && @ship != nil && @ship.sunk? == false
      "H"
    elsif @fired_upon == true && @ship != nil && @ship.sunk? == true
      "X"
    elsif show_ship == true && @ship != nil
      "S"
    else
      "."
    end
  end

end
