require_relative 'Generator/Charts'
require_relative 'Generator/Data'

class Generator

  def self.run
    charts_html = self.charts.collect{|chart| chart.html}.join

    template = File.read('template.html')

    html = template % charts_html

    print html
  end

  def self.charts
      [ library_chart ] + library_version_charts
  end

  def self.library_chart
      libraryData = LibraryData.new

      libraryChart = LibraryChart.new(libraryData)
      libraryChart.title = 'Top 15 most-used JavaScript libraries'
      libraryChart.limit = 15

      libraryChart
  end

  def self.library_version_charts
      libraryData = LibraryData.new
      libraryVersionData = LibraryVersionData.new

      libraryData.labels.first(10).collect do |library|
          data_chunk = libraryVersionData.for library

          chart = LibraryVersionChart.new(data_chunk)
          chart.title = "Versions in use for JavaScript library #{library}"

          chart
      end
  end

end
