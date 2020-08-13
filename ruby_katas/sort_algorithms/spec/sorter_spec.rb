require 'sorter'

RSpec.describe Sorter do
  let(:unsorted_data) { [14, 11, 8, 13, 16, 15, 2, 1, 3, 10, 12, 1, 11, 4, 7, 9] }
  let(:sorted_data)   { [1, 1, 2, 3, 4, 7, 8, 9, 10, 11, 11, 12, 13, 14, 15, 16] }

  [
    Sorter::Strategies::RubySort,
    Sorter::Strategies::BubbleSort,
    Sorter::Strategies::SelectionSort
  ].each do |sorting_strategy|
    describe sorting_strategy.to_s do
      subject { described_class.new(unsorted_data, strategy: sorting_strategy) }

      it 'sorts step by step' do
        until subject.completed? do subject.tick end

        error_msg = "Original: #{unsorted_data}\nResult:   #{subject.result}\nExpected: #{sorted_data}"
        expect(subject.result).to eql(sorted_data), error_msg
      end

      it 'sorts in a single step' do
        expect(subject.sort).to eql(sorted_data)
      end

      it 'does not change the input' do
        input_before = unsorted_data.dup

        subject.tick

        expect(input_before).to eql(unsorted_data)
      end

      it 'returns the input if we never ticked' do
        expect(subject.result).to eql(unsorted_data)
      end
    end
  end
end




