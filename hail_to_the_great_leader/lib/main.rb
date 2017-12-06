require 'nuke_deployer'
require 'great_leader_reporter'

class Main
  def call(data)
    report = NukeDeployer.new(data).call
    GreatLeaderReporter.new(report).call
  end
end
