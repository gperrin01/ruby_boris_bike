require 'pry'
require_relative '../lib/docking_station'
require_relative '../lib/van'
require_relative '../lib/bike'

describe Van do

  let(:van) {Van.new(:capacity => 20)}
  let(:bike) {Bike.new}
  let(:station) { DockingStation.new(:capacity => 20) }

  def fill_van(van)
    20.times do 
      broken_bike = Bike.new
      broken_bike.break
      van.load_broken(broken_bike, station)
    end
  end

  ## interaction with docking station
  it "can take a bike from the station" do
    expect(van.bike_count).to eq 0
    bike.break
    van.load_broken(bike, station)
    expect(van.bike_count).to eq 1 
  end
  it "should only load broken bikes frm the station" do
    working_bike = Bike.new
    expect { van.load_broken(working_bike, station) }.to raise_error RuntimeError 
  end
  it "can release bikes back to the station" do 
    bike.break
    van.load_broken(bike, station)
    bike.fix
    van.unload_fixed(bike, station)
    expect(van.bike_count).to eq 0
  end
  it "ensure the station docked the bike" do
    expect(station.bike_count).to eq 0
    van.unload_fixed(bike, station)
    expect(station.bike_count).to eq 1
  end
  it "can only release fixed bikes to the station" do
    bike.break
    expect{van.unload_fixed(bike, station)}.to raise_error RuntimeError
  end

  # it "should know what bikes are fixed and broken" do
  # end

  ## general stuff
  it 'should know when reaches full capacity' do
    expect(van.full?).to be false
    fill_van(van)
    expect(van.full?).to be true
  end
  it "should not accept a bike when full" do
    fill_van(van)
    expect { van.load_broken(bike, station) }.to raise_error RuntimeError 
  end




  #### interactions with garage
  it "should be able to unload bikes" do

  end



end