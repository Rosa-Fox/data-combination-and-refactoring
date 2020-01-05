# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/article'
require_relative '../../lib/parse_data'
RSpec.describe ParseData, type: :model do
  let(:article) { Article.new('articles.csv') }
  let(:authors) { 'authors.json' }
  let(:journals) { 'journals.csv' }
  let(:data) { ParseData.new(article, authors, journals) }
  let(:first_line) { ['10.1234/altmetric0', 'Small Wooden Chair', '1337-8688'] }
  let(:parse_data) { ParseData.new(Article.new(first_line), authors, journals) }

  context 'initialize' do
    it 'sets journals' do
      expect(data.journals).to eq('journals.csv')
    end

    it 'sets authors' do
      expect(data.authors).to eq('authors.json')
    end

    it 'sets articles' do
      expect(data.article.article).to eq('articles.csv')
    end
  end

  context 'sets attributes' do
    it 'parses article DOI' do
      expect(parse_data.doi).to eq('10.1234/altmetric0')
    end

    it 'parses article title' do
      expect(parse_data.article_title).to eq('Small Wooden Chair')
    end

    it 'parses issn' do
      expect(parse_data.issn).to eq('1337-8688')
    end

    it 'parses article author' do
      expect(parse_data.author).to eq('Amari Lubowitz')
    end

    it 'parses journal title' do
      expect(parse_data.journal_title).to eq('Shanahan, Green and Ziemann')
    end
  end
end
