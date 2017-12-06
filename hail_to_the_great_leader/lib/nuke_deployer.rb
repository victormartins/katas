
class NukeDeployer
  NoFireResponse = Struct.new(:deployed, :casualties, :photos)

  def initialize(data)
    @location           = data[:location]
    @enemy_of_the_state = data[:enemy_of_the_state]
  end

  # TODO: CHECK NUKE CONTRACT
  def call
    return empty_report unless @enemy_of_the_state
    Nuke.new(@location).call
  end

  private

  def empty_report
    NoFireResponse.new.tap do |r|
      r.deployed   = false
      r.casualties = 0
      r.photos     = []
    end
  end
end
