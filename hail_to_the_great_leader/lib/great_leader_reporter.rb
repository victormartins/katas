class GreatLeaderReporter
  def initialize(report)
    @report = report
  end

  def call
    return "The Leader is Happy!" if @report[:casualties] >= 100_000
    raise "THE LEADER IS ANGRYYYY!!!!!"
  end
end
