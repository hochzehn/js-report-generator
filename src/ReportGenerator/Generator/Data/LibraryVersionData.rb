require 'json'

class LibraryVersionData < DataFromJson
  FILE = 'source/js.library.version.json'

  def initialize
    super
    @data = group_by_name(@data).collect{ |group| sort_by_version group }.flatten
  end

  def for library
    new_data = group_by_name(data).select{ |group| group.first["name"] == library}.flatten

    result = self.class.new
    result.data = new_data

    result
  end

  def group_by_name list
    result = [ ]

    prev = ""
    current = []
    list.each do |entry|
      if (entry["name"] != prev)
        result << current unless current.empty?
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
