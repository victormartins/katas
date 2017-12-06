class GreatLeaderReporter
  def initialize(report)
    @report = report
  end

  def call
    return happy_leader if @report[:no_fire]
    return happy_leader if @report[:casualties] >= 100_000
    raise "THE LEADER IS ANGRYYYY!!!!!"
  end

  private

  def happy_leader
    "The Leader is Happy!"
  end
end
