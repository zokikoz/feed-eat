class Time
  def date_correct!
    return if blank?

    to_datetime
  rescue Date::Error
    nil
  end
end
