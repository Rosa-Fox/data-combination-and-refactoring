# frozen_string_literal: true

require 'json'
require 'csv'

module ReadData
  def read_csv(file)
    CSV.read(file)
  end

  def read_json(file)
    json_file = File.open(file)
    JSON.load(json_file)
  end
end
