module DateRanges
  def same_month_different_year
    start_date.year != end_date.year
  end

  def same_start_and_end_date
    start_date == end_date
  end

  def same_start_and_end_month
    start_date.month == end_date.month
  end

  def same_start_and_end_year
    start_date.year == end_date.year
  end

  def start_and_end_time
    start_time && end_time
  end
end
