require_relative './../lib/main.rb'
require 'spec_helper'

RSpec.describe Main do
  let(:nuke_response) { double(deployed: deployed, casualties: casualties, photos: photos, location: location) }
  let(:happy_leader) { 'The Leader is Happy!' }
  let(:enemy_location) { { x: 1, y: 1 } }
  let(:friend_location) { { x: 2, y: 1 } }
  let(:data) do
    {
      enemy_of_the_state: enemy_of_the_state,
      location: location
    }
  end

  describe 'Happy Path: ' do
    describe 'When enemy' do
      before { allow_any_instance_of(Nuke).to receive(:call).and_return(nuke_response) }

      let(:deployed) { true }
      let(:casualties) { 100_000 }
      let(:photos) { ['photo_1', 'photo_2'] }
      let(:location) { enemy_location }
      let(:enemy_of_the_state) { true }

      it 'fires a nuke to a given location' do
        expect_any_instance_of(Nuke).to receive(:call)
        expect(Main.new.call(data)).to eq(happy_leader)
      end
    end

    describe 'When friend' do
      let(:location) { friend_location }
      let(:enemy_of_the_state) { false }

      it 'does not fire any nukes!' do
        expect_any_instance_of(Nuke).to_not receive(:call)
        expect(Main.new.call(data)).to eq(happy_leader)
      end
    end
  end

  describe 'what if...' do
    describe 'Contract Problems' do
      context 'when enemy_of_the_state is a string' do
        let(:location) { friend_location }
        let(:casualties) { 0 }
        let(:photos) { [] }
        let(:enemy_of_the_state) { 'false' }

        xit 'should call tech support to fix the error before great leader finds out!' do
          expect(EmergecyTechSupport).to receive(:call).and_call_original
          Main.new.call(data)
        end
      end

      context 'when enemy_of_the_state is nil' do
        let(:location) { enemy_location }
        let(:casualties) { 0 }
        let(:photos) { [] }
        let(:enemy_of_the_state) { nil }

        xit 'should call tech support and fix the error before great leader finds out!' do
          expect(EmergecyTechSupport).to receive(:call).and_call_original
          Main.new.call(data)
        end
      end

      context 'if Nuke sends the wrong response object' do
        before { allow_any_instance_of(Nuke).to receive(:call).and_return(nuke_response) }

        let(:nuke_response) { :broken_report_response }
        let(:location) { enemy_location }
        let(:enemy_of_the_state) { true }

        xit 'should call tech support and fix the error before great leader finds out!' do
          expect(EmergecyTechSupport).to receive(:call).and_call_original
          Main.new.call(data)
        end
      end
    end

    describe 'Error Handling' do
      before { allow_any_instance_of(Nuke).to receive(:call).and_return(nuke_response) }

      context 'fewer casualties' do
        let(:deployed) { true }
        let(:enemy_of_the_state) {true }
        let(:location) { enemy_location }
        let(:casualties) { 10 }
        let(:photos) { ['photo_1', 'photo_2'] }

        xit 'retries to calibrate the satelite a few times and then calls tech support and raises error!' do
          expect(TargetingSatellite).to receive(:calibrate)
            .exactly(TargetingSatellite::MAX_CALIBRATION_RETRIES)
            .times
            .and_call_original
          expect(EmergecyTechSupport).to receive(:call).and_call_original

          expect { Main.new.call(data) }.to raise_error(LowKillCountError)
        end
      end
    end
  end
end
