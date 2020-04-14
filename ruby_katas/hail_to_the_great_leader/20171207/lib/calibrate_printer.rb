# frozen_string_literal: true

class CalibratePrinter
  MAX_CALIBRATION_RETRIES = 3

  def self.calibrate
    print 'Printer Calibration in Course...'
    generator = Random.new
    sleep(generator.rand(0.1..1.0))
    print "Done!\n"
  end
end
