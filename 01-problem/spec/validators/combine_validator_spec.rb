# frozen_string_literal: true

require 'spec_helper'
require_relative '../../validators/combine_validator'

RSpec.describe CombineValidator, type: :model do
  let(:combine_validator) do
    CombineValidator.new(
      [
        '--format',
        'csv',
        'journals.csv',
        'articles.csv',
        'authors.json'
      ]
    )
  end

  context 'initialize' do
    it 'can be created with argvs' do
      expect(combine_validator.argv).to eq(
        [
          '--format',
          'csv',
          'journals.csv',
          'articles.csv',
          'authors.json'
        ]
      )
    end
  end

  context 'valid args' do
    it 'is valid' do
      expect(combine_validator.validate_args).to eq(true)
    end
  end

  context 'invalid args' do
    it 'is invalid' do
      combine_validator.argv[0] = '--form'
      expect(combine_validator.validate_args).to eq(false)
    end

    it 'is invalid when arg0 is incorrect' do
      combine_validator.argv[0] = '--form'

      expect_error_with_message('Invalid argument. Did you mean: --format ?')
    end

    it 'is invalid when arg1 is incorrect' do
      combine_validator.argv[1] = 'css'

      expect_error_with_message('Invalid argument, must be json or csv')
    end

    it 'is invalid when arg2 is incorrect' do
      combine_validator.argv[2] = 'journal.csv'

      expect_error_with_message('Invalid file name argument')
    end

    it 'is invalid when arg3 is incorrect' do
      combine_validator.argv[2] = 'article.csv'

      expect_error_with_message('Invalid file name argument')
    end

    it 'is invalid when arg4 is incorrect' do
      combine_validator.argv[3] = 'author.json'
      expect_error_with_message('Invalid file name argument')
    end

    it 'is invalid when file does not exist' do
      allow(File).to receive(:exist?).with('journals.csv').and_return(false)

      message = 'journals.csv does not exist in root directory - please ensure it is there'
      expect_error_with_message(message)
    end
  end

  def expect_error_with_message(message)
    expect { combine_validator.valid_args? }.to raise_error(
      ScriptArgumentError
    ).with_message(
      message
    )
  end
end
