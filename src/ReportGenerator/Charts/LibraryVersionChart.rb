class LibraryVersionChart < ChartFromJson
  FILE = 'source/js.library.version.json'

  def initialize
    super

    @options.merge! ({ axisY: { offset: 200 }})
  end

  def data
    result = super
    group_by_name(result).collect{ |group| sort_by_version group }.flatten
  end

  def group_by_name list
    result = [ ]

    prev = ""
    current = []
    list.each do |entry|
      if (entry["name"] != prev)
        result << current
        current = []
      end

      prev = entry["name"]
      current << entry
    end

    result << current

    result
  end

  def sort_by_version list
    list.sort do |x,y|
      # Replace unparseable versions with empty string
      begin
        xVersion = Gem::Version.new(x["version"])
      rescue ArgumentError
        xVersion = Gem::Version.new('')
      end
      begin
        yVersion = Gem::Version.new(y["version"])
      rescue ArgumentError
        yVersion = Gem::Version.new('')
      end

      yVersion <=> xVersion
    end
  end

  def labels
    data.collect{|item| item["name"] + " " + item["version"].to_s }
  end

  def series
    data.collect{|item| item["usages"].to_i }
  end
end
