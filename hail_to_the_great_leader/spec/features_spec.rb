require_relative './../lib/main.rb'
require 'spec_helper'

RSpec.describe Main do



  describe 'Happy Path: ' do
    describe 'When enemy' do
      before { allow_any_instance_of(Nuke).to receive(:call).and_return(nuke_response) }
      let(:nuke_response) { double(deployed: deployed, casualties: casualties, photos: photos) }

      let(:deployed) { true }
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

    describe 'When friend' do
      let(:data) do
        {
          enemy_of_the_state: false,
          location: { x: 2, y: 1 }
        }
      end

      it 'does not fire any nukes!' do
        expect(Main.new.call(data)).to eq('The Leader is Happy!')
      end
    end
  end

  describe 'what if...' do
    describe 'Contract Problems' do
      context 'when enemy_of_the_state is a word' do
        let(:casualties) { 0 }
        let(:photos) { [] }

        let(:data) do
          {
            enemy_of_the_state: 'false',
            location: { x: 2, y: 1 }
          }
        end

        it 'should call tech support and fix the error before great leader finds out!' do
          expect(EmergecyTechSupport).to receive(:call)
          Main.new.call(data)
        end
      end

      context 'when enemy_of_the_state is nil' do
        let(:casualties) { 0 }
        let(:photos) { [] }

        let(:data) do
          {
            enemy_of_the_state: nil,
            location: { x: 2, y: 1 }
          }
        end

        it 'should call tech support and fix the error before great leader finds out!' do
          expect(EmergecyTechSupport).to receive(:call)
          Main.new.call(data)
        end
      end
    end

    describe 'Error Handling' do
      before { allow_any_instance_of(Nuke).to receive(:call).and_return(nuke_response) }
      let(:nuke_response) { double(deployed: deployed, casualties: casualties, photos: photos) }

      xcontext 'few casualties' do
        let(:deployed) { true }
        let(:casualties) { 10 }
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
    end
  end
end
