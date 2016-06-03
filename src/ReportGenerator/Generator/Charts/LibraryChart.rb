class LibraryChart < Chart
  LIMIT=15

  attr_accessor :limit

  def series
    data.series.first LIMIT
  end

  def labels
    data.labels.first LIMIT
  end
end
