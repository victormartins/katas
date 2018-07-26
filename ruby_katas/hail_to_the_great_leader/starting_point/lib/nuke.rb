class Nuke
  def initialize(location)
    @location = location
  end

  def call
    raise 'FRIENDLY FIRE!' if @location[:x] == 2
  end
end
