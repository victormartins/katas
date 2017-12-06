require 'nuke'

class NukeDeployer
  def initialize(data)
    @location = data[:location]
    @enemy_of_the_state = data[:enemy_of_the_state]
  end

  def call
    @stats = ignite! if @enemy_of_the_state

    {
      casualties: @stats.casualties,
      photos:     @stats.photos
    }
  end

  private

  def ignite!
    Nuke.new(@location).call
  end
end
