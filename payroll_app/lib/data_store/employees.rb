# frozen_string_literal: true

module PayrollApp
  module DataStore
    class Employees
      include Contracts::Core
      include Contracts::Builtin

      Contract Num => Models::Employee
      def self.find(id)
      end
    end
  end
end
