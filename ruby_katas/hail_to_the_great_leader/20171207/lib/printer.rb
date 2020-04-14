# frozen_string_literal: true

require 'paper_format'
require 'paper'
require 'paper_tray'
require 'print'

class Printer
  def call(content:, options: {})
    paper_format = options.fetch(:paper_format, PaperFormat::A3)

    paper = Paper.new(paper_format)
    Print.call(paper: paper, content: content)
  rescue PrinterError => e
    TechSupport.call(e)
  end
end
