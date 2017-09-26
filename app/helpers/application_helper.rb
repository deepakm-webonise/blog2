module ApplicationHelper
  def article_time(time)
    time.to_formatted_s(:short_ordinal) + time.strftime(' at %I:%M %p')
  end
end
