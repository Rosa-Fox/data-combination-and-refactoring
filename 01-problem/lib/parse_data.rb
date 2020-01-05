# frozen_string_literal: true

require_relative 'author'
require_relative 'journal'

class ParseData
  attr_reader :article, :authors, :journals
  def initialize(article, authors, journals)
    @article = article
    @authors = authors
    @journals = journals
  end

  def doi
    article.doi
  end

  def article_title
    article.article_title
  end

  def issn
    article.issn
  end

  def author
    author = Author.new(doi, authors)
    author.find_authors
  end

  def journal_title
    journal = Journal.new(issn, journals)
    journal.title
  end
end
