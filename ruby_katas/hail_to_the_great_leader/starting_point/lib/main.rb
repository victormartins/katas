require 'objectives'
require 'nuke'
require 'targeting_satellite'
require 'nuke_deployer'
require 'great_leader_reporter'
require 'emergency_tech_support'

include Objectives

class Main
  def call(data)
    report = NukeDeployer.new(data).call
    GreatLeaderReporter.new(report).call
  end
end
