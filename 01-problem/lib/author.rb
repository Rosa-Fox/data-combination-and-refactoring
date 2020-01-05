# frozen_string_literal: true

class Author
  include ReadData
  attr_reader :doi, :data
  def initialize(doi, data)
    @doi = doi
    @data = read_json(data)
  end

  def find_authors
    names = []
    data.each do |data|
      found = data['articles'].detect { |article| article == doi }
      names << data['name'] unless found.nil?
    end
    names.join(', ')
  end
end
