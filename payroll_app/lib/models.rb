# frozen_string_literal: true

module PayrollApp
  module Models
    require_relative 'models/base'
    Dir["#{__dir__}/**/*.rb"].each { |model| require model }
  end
end
