require_relative '../lib/bike'

describe Bike do

  it 'should not be broken when created' do
    bike = Bike.new
    expect(bike.broken?).to be false
  end
  it 'should be able to break' do
    bike = Bike.new
    bike.break
    expect(bike.broken?).to be true
  end

end