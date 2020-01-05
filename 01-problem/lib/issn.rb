# frozen_string_literal: true

class Issn
  attr_reader :issn
  def initialize(issn)
    @issn = issn
  end

  def format_issn
    return issn if valid_format

    reformatted_issn = reformat_issn

    if valid_format
      reformatted_issn
    else
      'Invalid ISSN format'
    end
  end

  private

  def reformat_issn
    issn.insert(4, '-')
  rescue IndexError => e
    puts e.message.to_s
  end

  def valid_format
    issn =~ /^(\d\d\d\d-\d\d\d\d)$/
  end
end
