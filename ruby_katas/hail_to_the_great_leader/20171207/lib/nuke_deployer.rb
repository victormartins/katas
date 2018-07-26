class LowKillCountError < StandardError; end

class NukeDeployer
  NoFireResponse = Struct.new(:deployed, :casualties, :photos, :location)

  require 'contracts'
  include Contracts::Core
  include Contracts::Builtin

  Contract({location: Hash, enemy_of_the_state: Bool} => Any)
  def initialize(data)
    @location           = data[:location]
    @enemy_of_the_state = data[:enemy_of_the_state]
    @current_retry = 1
  end

  Contract(nil => RespondTo[:deployed, :casualties, :photos, :location])
  def call
    report = nil
    report = launch_nuke! if @enemy_of_the_state
    report || no_fire_report
  end

  private

  def launch_nuke!
    handle_low_kill_count { fire! }
  end

  Contract(nil => RespondTo[:deployed, :casualties, :photos, :location])
  def fire!
    Nuke.new(@location).call
  end

  def handle_low_kill_count
    response = yield
    raise LowKillCountError if response.casualties < MIN_CASUALTIES
    response
  rescue LowKillCountError => error
    if @current_retry <= TargetingSatellite::MAX_CALIBRATION_RETRIES
      warn "RETRY: = #{@current_retry}"
      @current_retry += 1
      TargetingSatellite.calibrate
      retry
    else
      EmergecyTechSupport.call(error)
      raise error
    end
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
