require 'json'
class DataFromJson
  FILE = nil

  def data
    raise "Missing file path for loading data." unless self.class::FILE
    @data ||= JSON.parse(File.read(self.class::FILE));
  end

end
