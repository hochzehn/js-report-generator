require_relative 'Generator/Charts'

class Generator

  def self.run
    charts = [ LibraryChart.new, LibraryVersionChart.new ]
    charts_html = charts.collect{|chart| chart.html}.join

    template = File.read('template.html')

    html = template % charts_html

    print html
  end

end
