require 'ostruct'

class PrinterError < StandardError; end

class Print
  def self.call(paper:, content:)
    puts "Printing #{content} to paper format: #{paper.format}"
    PaperTray
      .instance
      .queue
      .push(
        OpenStruct.new(
          format: paper.format,
          content: content
        )
      )
    true
   end
end
