require "date"
require "fixnum"

require_relative 'date_ranges'
require_relative 'date_formatter'

class DateRangeFormatter
  include DateRanges
  include DateFormatter
  attr_reader :start_date, :end_date, :start_time, :end_time
  def initialize(start_date, end_date, start_time = nil, end_time = nil)
    @start_date = Date.parse(start_date)
    @end_date = Date.parse(end_date)
    @start_time = start_time
    @end_time = end_time
  end

  def to_s
    return format_matching_start_and_end_dates if same_start_and_end_date
    return format(format_date) unless format_non_matching_dates
    format_non_matching_dates
  end

private

  def format_matching_start_and_end_dates
    return format_start_and_end_date_time if start_and_end_time
    return format_start_date_time if start_time
    return format_until_end_time if end_time
    format_full_date(start_date)
  end

  def format(format_date_range)
    return format_start_and_end_date if start_and_end_time
    return format_start_date_time_range if start_time
    return format_end_date_time_range if end_time
    format_date_range
  end

  def format_non_matching_dates
    if same_start_and_end_month
      return format_same_month_different_year if same_month_different_year
      format(format_same_month_same_year)
    elsif same_start_and_end_year
      format(format_same_year)
    end
  end
end
