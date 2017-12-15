# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Transactions::Transaction do
  describe '#call' do
    it 'raises NotImplementedError' do
      expect { subject.call }.to raise_error(NotImplementedError)
    end
  end
end
