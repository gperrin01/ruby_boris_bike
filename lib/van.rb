class Van

  def initialize
    @bikes = []
  end

  def load_broken(bike, station)
    @bikes << bike
    station.release(bike)
  end

  def bike_count
    @bikes.length
  end





end