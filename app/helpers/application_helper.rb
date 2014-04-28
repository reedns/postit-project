module ApplicationHelper
  def fix_url(str)
    str.include?("http://") ? str : "http://" + str
  end

  def pretty_date_time(date_time)
    date_time.strftime("%m/%d/%Y %l:%M%P %Z")
  end
end
