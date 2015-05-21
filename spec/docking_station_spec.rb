require 'pry'
require_relative '../lib/docking_station'
require_relative '../lib/bike'

describe DockingStation do 

  let(:station) {DockingStation.new}
  let(:station) { DockingStation.new(:capacity => 20) }
  let(:bike) { Bike.new }

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
    20.times{station.dock(bike) }
    expect(station.full?).to be true
  end

end