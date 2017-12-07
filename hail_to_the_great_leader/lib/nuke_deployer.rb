
class NukeDeployer
  NoFireResponse = Struct.new(:deployed, :casualties, :photos, :location)

  def initialize(data)
    @location           = data[:location]
    @enemy_of_the_state = data[:enemy_of_the_state]
  end

  def call
    nuke = Nuke.new(@location)
    report = nuke.call if @enemy_of_the_state
    report || empty_report
  end

  private

  def empty_report
    NoFireResponse.new.tap do |r|
      r.deployed   = false
      r.casualties = 0
      r.photos     = []
      r.location   = @location
    end
  end
end
