class Bike

  def initialize
    @broken = false
    
  end

  def broken?
    @broken 
  end
  def break
    # can you break on a bike already broken?
    @broken = true
  end
  def fix
    #can you fix on a non-broken bike?
    @broken = false
  end


end