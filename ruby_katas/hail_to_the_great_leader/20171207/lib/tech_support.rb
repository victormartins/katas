# frozen_string_literal: true

class TechSupport
  def self.call(error)
    puts ''
    puts '-' * 50
    puts 'TECH_SUPPORT_CALL!'.center(50)
    puts error.message
    puts '-' * 50
    puts ''
  end
end
