require 'pry'
require_relative '../lib/docking_station'
require_relative '../lib/van'
require_relative '../lib/bike'

describe Van do

  let(:van) {Van.new}
  let(:bike) {Bike.new}
  let(:station) { DockingStation.new(:capacity => 20) }

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

  it 'should know when reaches full capacity' do

  end



  it "should be able to unload bikes" do

  end



end