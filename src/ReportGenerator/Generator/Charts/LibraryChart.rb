class LibraryChart < ChartFromJson
  FILE = 'source/js.library.json'

  def labels
    data.collect{|item| item["name"] }
  end

  def series
    data.collect{|item| item["usages"].to_i }
  end
end
