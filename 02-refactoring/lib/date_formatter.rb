module DateFormatter
  def format_date
    "#{format_full_date(start_date)} - #{format_full_date(end_date)}"
  end

  def format_full_date(date)
    date.strftime("#{date.day.ordinalize} %B %Y")
  end

  def format_start_date_time_range
    "#{format_full_date(start_date)} at #{start_time} - #{format_full_date(end_date)}"
  end

  def format_end_date_time_range
    "#{format_full_date(start_date)} - #{format_full_date(end_date)} at #{end_time}"
  end

  def format_start_date_time
    "#{format_full_date(start_date)} at #{start_time}"
  end

  def format_start_and_end_date_time
    format_start_date_time + " to #{end_time}"
  end

  def format_until_end_time
    format_start_date_time(end_time).gsub('at', 'until')
  end

  def format_start_and_end_date
    format_start_date_time_range + " at #{end_time}"
  end

  def format_same_month_different_year
    start_date.strftime("#{start_date.day.ordinalize} %B %Y - ") + end_date.strftime("#{end_date.day.ordinalize} %B %Y")
  end

  def format_same_month_same_year
    start_date.strftime("#{start_date.day.ordinalize} - #{end_date.day.ordinalize} %B %Y")
  end

  def format_same_year
    start_date.strftime("#{start_date.day.ordinalize} %B - ") + end_date.strftime("#{end_date.day.ordinalize} %B %Y")
  end
end
