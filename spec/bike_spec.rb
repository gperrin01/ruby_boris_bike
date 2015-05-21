require_relative '../lib/bike'

describe Bike do

  it 'should not be broken when created' do
    bike = Bike.new
    expect(bike.broken?).to be false
  end

end