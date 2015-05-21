class Van
  DEFAULT_CAPACITY = 20

  def initialize(options={})
    @bikes = []
    @capacity  = options.fetch(:capacity, DEFAULT_CAPACITY)
  end

  def load_broken(bike, station)
    if bike.broken?
      @bikes << bike
      station.release(bike)
    else raise "Bike is not broken"
    end
  end

  def unload_fixed(bike, station)
    if !bike.broken?
      @bikes.delete(bike)
      station.dock(bike)
    else raise "Bike is broken and should not be docked again"
    end
  end

  def bike_count
    @bikes.length
  end

  def full?
    bike_count == @capacity
  end





end