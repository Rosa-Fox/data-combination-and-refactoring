# frozen_string_literal: true

require 'spec_helper'

require_relative '../combine'
require_relative '../lib/combined_output'
require_relative '../validators/combine_validator'
require_relative 'helpers/helper'

RSpec.describe Combine, type: :model do
  let(:combine_for_csv) { Combine.new(['--format', 'csv', 'journals.csv', 'articles.csv', 'authors.json']) }
  let(:combine_for_json) { Combine.new(['--format', 'json', 'journals.csv', 'articles.csv', 'authors.json']) }

  it 'can be created with argvs' do
    expect(combine_for_csv.argv).to eq(['--format', 'csv', 'journals.csv', 'articles.csv', 'authors.json'])
  end

  it 'combines data for csv output' do
    output = capture { combine_for_csv.generate_combined_output }

    expected_output = "DOI,Article Title,Author Name,Journal Title,Journal ISSN\n10.1234/altmetric0,Small Wooden Chair,Amari Lubowitz,\"Shanahan, Green and Ziemann\",1337-8688\n"

    expect(output).to include expected_output
  end

  it 'combines data for json output' do
    output = capture { combine_for_json.generate_combined_output }

    expected_output = "{\n    \"DOI\": \"10.1234/altmetric0\",\n    \"Article Title\": \"Small Wooden Chair\",\n    \"Author Name\": \"Amari Lubowitz\",\n    \"Journal Title\": \"Shanahan, Green and Ziemann\",\n    \"Journal ISSN\": \"1337-8688\"\n  }"

    expect(output).to include expected_output
  end
end
