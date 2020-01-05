# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/author'

RSpec.describe Author, type: :model do
  let(:data) { 'authors.json' }
  let(:doi) { '10.1234/altmetric0' }
  let(:author) { Author.new(doi, data) }

  context 'initialize' do
    it 'sets doi' do
      expect(author.doi).to eq('10.1234/altmetric0')
    end

    it 'sets data' do
      expect(author.data).to include(
        'name' => 'Akeem Toy',
        'articles' =>
        ['10.1234/altmetric846',
         '10.1234/altmetric93',
         '10.1234/altmetric201',
         '10.1234/altmetric568',
         '10.1234/altmetric820',
         '10.1234/altmetric820']
      )
    end
  end

  context 'authors' do
    it 'finds authors when there is one author' do
      expect(author.find_authors).to eq('Amari Lubowitz')
    end

    it 'finds authors when there are multiple authors' do
      doi = '10.1234/altmetric127'
      author = Author.new(doi, data)
      expect(author.find_authors).to eq('Annamarie Nader, Lucile Stamm V')
    end
  end
end
