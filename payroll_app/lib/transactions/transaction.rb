# frozen_string_literal: true

module PayrollApp
  module Transactions
    # This class follows the COMMAND pattern.
    # It is the responsability of the transaction to specify the association
    # between ayment type and payment schedule. This means that this association
    # can be changed without changing the code model
    #
    class Transaction
      def call
        raise(NotImplementedError)
      end
    end
  end
end
