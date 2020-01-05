# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/article'

RSpec.describe Article, type: :model do
  let(:article) { Article.new(['10.1234/altmetric0', 'Small Wooden Chair', '1337-8688']) }
  context 'initialize' do
    it 'sets article' do
      expect(article.article).to eq(
        [
          '10.1234/altmetric0',
          'Small Wooden Chair',
          '1337-8688'
        ]
      )
    end
  end

  context 'sets attributes' do
    it 'parses article DOI' do
      expect(article.doi).to eq('10.1234/altmetric0')
    end

    it 'parses article title' do
      expect(article.article_title).to eq('Small Wooden Chair')
    end

    it 'parses issn' do
      expect(article.issn).to eq('1337-8688')
    end
  end
end
