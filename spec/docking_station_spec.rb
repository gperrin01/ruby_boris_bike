require 'pry'
require_relative '../lib/docking_station'
require_relative '../lib/bike'
require_relative '../lib/van'

describe DockingStation do 

  # let(:station) {DockingStation.new}
  let(:station) { DockingStation.new(:capacity => 20) }
  let(:bike) { Bike.new }
  let(:van) { Van.new }

  def fill_station(station)
    20.times{station.dock(Bike.new)}
  end

  it 'should be able to accept a bike' do
    expect(station.bike_count).to eq 0
    station.dock(bike)
    expect(station.bike_count).to eq 1    
  end
  it 'should release a bike' do
    station.dock(bike)
    station.release(bike)
    expect(station.bike_count).to eq 0
  end
  it 'shoudl know when it\'s full' do
    expect(station.full?).to be false
    fill_station(station)
    expect(station.full?).to be true
  end
  it 'should not accept a bike if it\'s full' do
    fill_station(station)
    expect { station.dock(bike) }.to raise_error RuntimeError 
  end
  it "should provide the list of available bikes" do
    working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break
    station.dock(working_bike)
    station.dock(broken_bike)
    expect(station.available_bikes).to eq( [working_bike])
  end

  it "should know when releasing bike to the van" do 
    station.dock(bike)
    van.load_broken(bike, station)
    expect(station.bike_count).to eq 0
  end



end












