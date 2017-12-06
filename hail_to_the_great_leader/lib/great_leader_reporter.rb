class GreatLeaderReporter
  def initialize(report)
    @report = report
  end

  def call
    return happy_leader unless @report.deployed

    raise "I WANT MORE CASUALTIES!!!!!!" if @report.casualties < 100_000
    raise "I WANT PICS!!!!!!" if @report.photos.length < 1

    happy_leader
  end

  private

  def happy_leader
    "The Leader is Happy!"
  end
end
