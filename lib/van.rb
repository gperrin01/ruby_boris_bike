class Van

  def initialize
    @bikes = []
  end

  def load_broken(bike, station)
    if bike.broken?
      @bikes << bike
      station.release(bike)
    else raise "Bike is not broken"
    end
  end

  def bike_count
    @bikes.length
  end





end