# frozen_string_literal: true

require_relative 'lib/combined_output'
require_relative 'validators/combine_validator'

class Combine
  attr_reader :argv
  def initialize(argv)
    @argv = argv
  end

  def generate_combined_output
    return unless validate

    case argv[1]
    when 'json'
      combine_output.generate_json
      `echo JSON file has been generated! >&2`
    when 'csv'
      combine_output.generate_csv
      `echo CSV file has been generated! >&2`
    end
  end

  private

  def combine_output
    CombinedOutput.new(argv[2], argv[3], argv[4])
  end

  def validate
    validator = CombineValidator.new(argv)
    validator.validate_args
  end
end

combine = Combine.new(ARGV)
combine.generate_combined_output
