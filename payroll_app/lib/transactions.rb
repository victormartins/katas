# frozen_string_literal: true

module PayrollApp
  module Transactions
    require_relative 'transactions/transaction'
    Dir["#{__dir__}/**/*.rb"].each { |transaction| require transaction  }
  end
end
