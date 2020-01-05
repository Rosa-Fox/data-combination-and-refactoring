# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/journal'

RSpec.describe Journal, type: :model do
  let(:issn) { '1167-8230' }
  let(:data) { 'journals.csv' }
  let(:journal) { Journal.new(issn, data) }
  let(:journal_non_existent_issn) { Journal.new('1112', data) }

  context 'initialize' do
    it 'sets issn' do
      expect(journal.issn).to eq('1167-8230')
    end

    it 'sets data' do
      expect(journal.data).to include(
        %w[Title ISSN],
        %w[Bartell-Collins 1167-8230], ['Sporer, Kihn and Turner', '2885-6503']
      )
    end
  end

  context 'find title' do
    it 'finds the journal title' do
      expect(journal.title).to eq('Bartell-Collins')
    end

    it 'can\'t find the journal title' do
      expect(journal_non_existent_issn.title).to eq(nil)
    end
  end
end
