require_relative './../lib/main.rb'
require 'spec_helper'

RSpec.describe Main do
  before do
    allow_any_instance_of(Nuke).to receive(:call).and_return(nuke_response)
  end

  let(:nuke_response) do
    double(casualties: casualties, photos: photos)
  end


  describe 'Happy Path' do
    describe 'when enemy' do
      let(:casualties) { 100_000 }
      let(:photos) { ['photo_1', 'photo_2'] }

      let(:data) do
        {
          enemy_of_the_state: true,
          location: { x: 1, y: 1 }
        }
      end

      it 'fires a nuke to a given location' do
        expect(Main.new.call(data)).to eq('The Leader is Happy!')
      end
    end

    describe 'when friend' do
      let(:casualties) { 0 }
      let(:photos) { [] }

      let(:data) do
        {
          enemy_of_the_state: false,
          location: { x: 2, y: 1 }
        }
      end

      it 'fires a nuke to a given location' do
        expect(Main.new.call(data)).to eq('The Leader is Happy!')
      end
    end
  end

  describe 'what if...' do
    describe 'enemy_of_the_state' do
      # context 'when word' do
      #   let(:casualties) { 100_000 }
      #   let(:photos) { ['photo_1', 'photo_2'] }
      #
      #   let(:data) do
      #     {
      #       enemy_of_the_state: 'false',
      #       location: { x: 2, y: 1 }
      #     }
      #   end
      #
      #   it 'should not kill friends' do
      #     expect(Main.new.call(data)).to eq('The Leader is Happy!')
      #   end
      # end
    end
  end
end
