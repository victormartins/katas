class GreatLeaderReporter
  class AngryLeaderError < StandardError; end;

  def initialize(report)
    @report = report
  end

  def call
    handle_report_errors { check_report }
  end

  private

  def check_report
    assert!('NO BOOOM! TRAITORS!!!!') { missfire_on_enemy?}
    return happy_leader unless @report.deployed

    assert!('I WANT MORE CASUALTIES!!!!!!') { insuficient_casualties? }
    assert!('I WANT PICS!!!!!!!!') { no_pics? }
    happy_leader
  end

  def handle_report_errors
    yield
  rescue NoMethodError => error
    raise AngryLeaderError, "WHO BROKE THE REPORT????!!! RAGEEEE!!!!!\n #{error}"
  end

  def happy_leader
    'The Leader is Happy!'
  end

  def assert!(msg)
    raise AngryLeaderError, msg if yield
  end

  def missfire_on_enemy?
    !@report.deployed && @report.location[:x] == 1
  end

  def insuficient_casualties?
    @report.casualties < MIN_CASUALTIES
  end

  def no_pics?
    @report.photos.length < MIN_PHOTOS
  end
end
