class Nuke
  def initialize(location)
    raise 'FRIENDLY FIRE!' if location[:x] == 2
  end

  def call

  end
end
