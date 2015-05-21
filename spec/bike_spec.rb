require_relative '../lib/bike'

describe Bike do

  let(:bike) {Bike.new}

  it 'should not be broken when created' do
    expect(bike.broken?).to be false
  end
  it 'should be able to break' do
    bike.break
    expect(bike.broken?).to be true
  end
  it 'should be able to get fixed' do
    bike.break
    bike.fix
    expect(bike.broken?).to be false
  end

end