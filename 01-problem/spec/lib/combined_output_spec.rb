# frozen_string_literal: true

require 'spec_helper'
require_relative '../helpers/helper'
require_relative '../../lib/combined_output'

RSpec.describe CombinedOutput, type: :model do
  let(:combined_output) { CombinedOutput.new('journals.csv', 'articles.csv', 'authors.json') }

  context 'initialize' do
    it 'sets journals' do
      expect(combined_output.journals).to eq('journals.csv')
    end

    it 'sets articles' do
      expect(combined_output.articles).to eq('articles.csv')
    end

    it 'sets authors' do
      expect(combined_output.authors).to eq('authors.json')
    end
  end

  context 'CSV' do
    it 'generates CSV data' do
      output = capture { combined_output.generate_csv }
      expected_output = "DOI,Article Title,Author Name,Journal Title,Journal ISSN\n10.1234/altmetric0,Small Wooden Chair,Amari Lubowitz,\"Shanahan, Green and Ziemann\",1337-8688\n10.1234/altmetric100,Ergonomic Rubber Shirt,Lenny Kshlerin,\"Wilkinson, Gaylord and Gerlach\",2542-5856\n"

      expect(output).to include expected_output
    end
  end

  context 'JSON' do
    it 'generates JSON data' do
      output = capture { combined_output.generate_json }
      expected_output_first_line = "{\n    \"DOI\": \"10.1234/altmetric0\",\n    \"Article Title\": \"Small Wooden Chair\",\n    \"Author Name\": \"Amari Lubowitz\",\n    \"Journal Title\": \"Shanahan, Green and Ziemann\",\n    \"Journal ISSN\": \"1337-8688\"\n  }"
      expected_output_last_line = "{\n    \"DOI\": \"10.1234/altmetric997\",\n    \"Article Title\": \"Practical Plastic Table\",\n    \"Author Name\": \"Sage Waters I, Dr. Chandler Flatley\",\n    \"Journal Title\": \"Lind, Feeney and Hintz\",\n    \"Journal ISSN\": \"4826-6971\"\n  }"

      expect(output).to include expected_output_first_line
      expect(output).to include expected_output_last_line
    end
  end
end
