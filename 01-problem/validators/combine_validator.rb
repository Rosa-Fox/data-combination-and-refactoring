# frozen_string_literal: true

require_relative '../errors/script_argument_error'
class CombineValidator
  attr_reader :argv
  def initialize(argv)
    @argv = argv
  end

  def validate_args
    valid_args?
    true
  rescue ScriptArgumentError => e
    `echo #{e.class} >&2`
    `echo #{e.message} >&2`
    `echo #{e.example_command} >&2`
    false
  end

  def valid_args?
    unless validate_arg_0
      raise ScriptArgumentError, 'Invalid argument. Did you mean: --format ?'
    end
    unless validate_arg_1
      raise ScriptArgumentError, 'Invalid argument, must be json or csv'
    end
    unless validate_arg_2_3_4
      raise ScriptArgumentError, 'Invalid file name argument'
    end
    validate_files_exists
  end

  private

  def validate_files_exists
    files = [argv[2], argv[3], argv[4]]
    files.each do |file|
      unless files_exist(file)
        raise ScriptArgumentError,
              "#{file} does not exist in root directory - please ensure it is there"
      end
    end
  end

  def files_exist(file)
    File.exist?(file) ? true : false
  end

  def validate_arg_0
    argv[0] == '--format'
  end

  def validate_arg_1
    argv[1] == 'json' || argv[1] == 'csv'
  end

  def validate_arg_2_3_4
    validate_arg_2 && validate_arg_3 && validate_arg_4
  end

  def validate_arg_2
    argv[2] == 'journals.csv'
  end

  def validate_arg_3
    argv[3] == 'articles.csv'
  end

  def validate_arg_4
    argv[4] == 'authors.json'
  end
end
