require 'spec_helper'
require_relative '../../lib/issn'

RSpec.describe Issn, type: :model do
  let(:issn) { Issn.new('1337-8688') }
  let(:invalid_issn) { Issn.new('13378688') }
  let(:short_invalid_issn) { Issn.new('388') }
  let(:long_invalid_issn) { Issn.new('3888888888888888888') }

  context 'initialize' do
    it 'sets issn' do
      expect(issn.issn).to eq('1337-8688')
    end
  end

  context 'format issn' do
    it 'returns correct issn' do
      expect(issn.format_issn).to eq('1337-8688')
    end

    it 'format incorrect issn' do
      expect(invalid_issn.format_issn).to eq('1337-8688')
    end

    it 'Invalid when issn too short' do
      expect(short_invalid_issn.format_issn).to eq('Invalid ISSN format')
    end

    it 'Invalid when issn too long' do
      expect(long_invalid_issn.format_issn).to eq('Invalid ISSN format')
    end
  end
end
