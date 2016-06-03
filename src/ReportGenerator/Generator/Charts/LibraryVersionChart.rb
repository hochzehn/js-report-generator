class LibraryVersionChart < Chart

  def initialize data
    super data

    @options.merge! ({ axisY: { offset: 200 }})
  end

  def labels
    data.labels
  end

  def series
    data.series
  end
end
