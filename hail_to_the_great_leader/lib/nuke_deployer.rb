
class NukeDeployer
  NoFireResponse = Struct.new(:deployed, :casualties, :photos, :location)

  def initialize(data)
    @location           = data[:location]
    @enemy_of_the_state = data[:enemy_of_the_state]
  end

  def call
    report = nil
    report = launch_nuke! if @enemy_of_the_state
    report || no_fire_report
  end

  private

  def launch_nuke!
    Nuke.new(@location).call
  end

  def no_fire_report
    NoFireResponse.new.tap do |r|
      r.deployed   = false
      r.casualties = 0
      r.photos     = []
      r.location   = @location
    end
  end
end
