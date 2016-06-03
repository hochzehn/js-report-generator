require 'json'
class DataFromJson
  FILE = nil

  attr_accessor :data

  def initialize
    raise "Missing file path for loading data." unless self.class::FILE
    @data ||= JSON.parse(File.read(self.class::FILE));
  end

end
