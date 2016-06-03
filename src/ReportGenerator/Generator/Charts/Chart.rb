require 'json'
require 'securerandom'

class Chart
  attr_accessor :options, :title
  attr_reader :data

  def initialize data
    @data = data

    @options = {
      seriesBarDistance: 10,
      reverseData: true,
      height: "#{html_chart_height}px",
      horizontalBars: true,
      axisY: {
        offset: 140
      },
      axisX: {
         onlyInteger: true,
      }
    }
  end

  def chart_id
    @chart_id ||= "chart-" + SecureRandom.hex
  end

  def html
    html_title + html_container + html_script
  end

  def html_title
    return '' unless title
    '<h2>%s</h2>' % title
  end

  def html_container
    '<div id="%s" class="ct-chart"></div>' % chart_id
  end

  def html_script
    '<script>
       (function() {
         new Chartist.Bar(\'#%s\', %s, %s);
       })()
     </script>' % [chart_id, html_chart_data, html_chart_options]
  end

  def html_chart_data
    '{ labels: %s, series: [ %s ] }' % [labels, series]
  end

  def html_chart_options
    JSON.generate options
  end

  def html_chart_height
    labels.length * 20
  end
end
