class DockingStation

  def initialize
    @bikes = []
  end

  def bike_count
    @bikes.length
  end

  def dock(bike)
    @bikes << bike
  end


end