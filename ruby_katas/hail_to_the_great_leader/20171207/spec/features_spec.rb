# frozen_string_literal: true

require_relative './../lib/printer.rb'
require 'spec_helper'

RSpec.describe Printer do
  let(:content) { "Hello\nWorld" }
  let(:printer_api) do
    {
      content: content,
      options: {
        paper_format: PaperFormat::A3
      }
    }
  end

  describe 'Happy Path: ' do
    describe 'Printed with success' do
      it 'adds a A4 printed page into the paper tray' do
        expect(PaperTray.instance.queue).to be_empty

        expect(Printer.new.call(printer_api)).to be(true)

        expect(PaperTray.instance.queue.size).to be(1)
        page = PaperTray.instance.queue.pop
        expect(page.format).to eql(PaperFormat::A3)
        expect(page.content).to eql(printer_api.fetch(:content))
      end

      it 'prints to Paper Format A4 by default ' do
        printer_api.delete(:options)
        Printer.new.call(printer_api)
        page = PaperTray.instance.queue.pop
        expect(page.format).to eql(PaperFormat::A3)
      end
    end
  end

  xdescribe 'what if...' do
    describe 'Contract Problems' do
      context 'when enemy_of_the_state is a string' do
        let(:location) { friend_location }
        let(:casualties) { 0 }
        let(:photos) { [] }
        let(:enemy_of_the_state) { 'false' }

        it 'should call tech support to fix the error before great leader finds out!' do
          expect(EmergecyTechSupport).to receive(:call).and_call_original
          Printer.new.call(printer_api)
        end
      end

      context 'when enemy_of_the_state is nil' do
        let(:location) { enemy_location }
        let(:casualties) { 0 }
        let(:photos) { [] }

        it 'should call tech support and fix the error before great leader finds out!' do
          expect(EmergecyTechSupport).to receive(:call).and_call_original
          Printer.new.call(printer_api)
        end
      end

      context 'if Nuke sends the wrong response object' do
        before { allow_any_instance_of(Nuke).to receive(:call).and_return(nuke_response) }

        let(:nuke_response) { :broken_report_response }
        let(:location) { enemy_location }

        it 'should call tech support and fix the error before great leader finds out!' do
          expect(EmergecyTechSupport).to receive(:call).and_call_original
          Printer.new.call(printer_api)
        end
      end
    end

    describe 'Error Handling' do
      before { allow_any_instance_of(Nuke).to receive(:call).and_return(nuke_response) }

      context 'fewer casualties' do
        let(:deployed) { true }
        let(:location) { enemy_location }
        let(:casualties) { MIN_CASUALTIES - 1 }
        let(:photos) { %w[photo_1 photo_2] }

        it 'retries to calibrate the satelite a few times and then calls tech support and raises error!' do
          expect(TargetingSatellite).to receive(:calibrate)
            .exactly(TargetingSatellite::MAX_CALIBRATION_RETRIES)
            .times
            .and_call_original
          expect(EmergecyTechSupport).to receive(:call).and_call_original

          expect { Printer.new.call(printer_api) }.to raise_error(LowKillCountError)
        end
      end
    end
  end
end
