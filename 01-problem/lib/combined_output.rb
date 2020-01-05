# frozen_string_literal: true

require_relative 'read_data'
require_relative 'parse_data'
require_relative 'article'

class CombinedOutput
  include ReadData
  attr_accessor :journals, :articles, :authors

  def initialize(journals, articles, authors)
    @journals = journals
    @articles = articles
    @authors = authors
  end

  def generate_csv
    article_csv = CSV.generate do |csv|
      csv << article_components
      read_and_parse_data(csv)
    end
    puts article_csv
  end

  def generate_json
    lines = []
    read_and_parse_data(lines)
    keys = article_components

    data = lines.map do |values|
      Hash[keys.zip(values)]
    end
    puts JSON.pretty_generate(data)
  end

  private

  def article_components
    ['DOI', 'Article Title', 'Author Name', 'Journal Title', 'Journal ISSN']
  end

  def read_and_parse_data(lines)
    read_csv(articles).drop(1).each do |article|
      data = ParseData.new(Article.new(article), authors, journals)
      lines << [
        data.doi,
        data.article_title,
        data.author,
        data.journal_title,
        data.issn
      ]
    end
  end
end
