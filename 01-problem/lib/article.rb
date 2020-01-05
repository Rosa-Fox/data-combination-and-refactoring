# frozen_string_literal: true

require_relative 'issn'
class Article
  attr_reader :article
  def initialize(article)
    @article = article
  end

  def doi
    article[0]
  end

  def article_title
    article[1]
  end

  def issn
    issn = Issn.new(article[2])
    issn.format_issn
  end
end
