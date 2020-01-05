# frozen_string_literal: true

class Journal
  include ReadData
  attr_reader :issn, :data

  def initialize(issn, data)
    @issn = issn
    @data = read_csv(data)
  end

  def title
    find_journal_with_issn = data.detect { |journal| journal[1] == issn }
    find_journal_with_issn[0]
  rescue NoMethodError => e
    puts e.message.to_s
  end
end
