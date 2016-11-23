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

      versionDataPerLibrary = libraryData.labels.first(10).collect do |library|
          libraryVersionData.for library
      end

      versionDataPerLibrary.reject!{|item| item.labels.count <= 1}

      versionDataPerLibrary.collect do |item|
          chart = LibraryVersionChart.new(item)
          chart.title = "#{item.library_name} versions"

          chart
      end
  end

end
