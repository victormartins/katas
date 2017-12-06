require 'nuke'

class NukeDeployer
  def initialize(data)
    @location = data[:location]
    @enemy_of_the_state = data[:enemy_of_the_state]
  end

  def call
    return empty_report unless @enemy_of_the_state
    @stats = ignite!

    {
      casualties: @stats.casualties,
      photos:     @stats.photos
    }
  end

  private

  def ignite!
    Nuke.new(@location).call
  end

  def empty_report
    {
      no_fire: true,
      casualties: 0,
      photos: []
    }
  end
end
