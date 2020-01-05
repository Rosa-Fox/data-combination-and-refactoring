# frozen_string_literal: true

class ScriptArgumentError < ArgumentError
  def initialize(msg = 'Invalid script argument')
    super
  end

  def example_command
    "Example command: ruby combine.rb --format json journals.csv articles.csv authors.json '>' full_articles.json"
  end
end
