class Van
  DEFAULT_CAPACITY = 20

  attr_accessor :bikes

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

  def fixed_bikes
    @bikes.reject{|bike| bike.broken?}
  end
  def broken_bikes
    @bikes.select{|bike| bike.broken?}
  end





end