require_relative 'Generator/Charts'
require_relative 'Generator/Data'

class Generator

  def self.run
    libraryData = LibraryData.new
    libraryVersionData = LibraryVersionData.new

    charts = [ LibraryChart.new(libraryData), LibraryVersionChart.new(libraryVersionData) ]
    charts_html = charts.collect{|chart| chart.html}.join

    template = File.read('template.html')

    html = template % charts_html

    print html
  end

end
