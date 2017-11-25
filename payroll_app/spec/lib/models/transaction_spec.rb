# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Models::Transaction do
  describe '#call' do
    it 'foo' do
      expect(subject).to respond_to(:call)
    end
  end
end
