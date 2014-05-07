module ApplicationHelper
  def fix_url(str)
    str.include?("http://") ? str : "http://" + str
  end

  def pretty_date_time(date_time)
    if logged_in? && !current_user.time_zone.blank?
      date_time = date_time.in_time_zone(current_user.time_zone)
    end 

    date_time.strftime("%m/%d/%Y | %l:%M%P %Z")
  end
end
