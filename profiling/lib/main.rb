require 'date'

class Main
  def call
    date_str = '2019-2-21'

    result = []
    150000.times { result << parse_date(date_str) }
    150000.times{ result << strp_date(date_str) }

    result.map! do |date|
      date + 1000
    end
  end

  def parse_date(date_str)
    Date.parse(date_str)
    another_method(date_str)
  end

  def strp_date(date_str)
    Date.strptime(date_str, '%Y-%M-%d')
  end

  def another_method(date_str)
    puts date_str.upcase
  end
end

require 'ruby-prof'

GC.disable
result = RubyProf.profile do
  Main.new.call
end

min_percent = 1

printer = RubyProf::FlatPrinter.new(result)
printer.print(File.open("results/app_flat_profile.txt", "w+"), min_percent: min_percent)

printer = RubyProf::GraphHtmlPrinter.new(result)
printer.print(File.open("results/app_graph_profile.html", "w+"), min_percent: min_percent)

printer = RubyProf::CallStackPrinter.new(result)
printer.print(File.open("results/app_call_stack_profile.html", "w+"))