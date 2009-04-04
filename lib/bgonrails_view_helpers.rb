module BgonrailsViewHelpers

  #Sitemap generator date format
  def w3c_date(date)
    date.utc.strftime("%Y-%m-%dT%H:%M:%S+00:00")
  end

  #Format datetime in view  
  def format_datetime(datetime)
    return datetime if !datetime.respond_to?(:strftime)
    #datetime = datetime.utc
    datetime.strftime("%d.%m.%Y %H:%M")
  end 
  
  #Format datetime for RSS
  def rss_date(date_time)
    CGI.rfc1123_date(date_time)     
  end   

  #SORTABLE LINK
  def sort_th(value)
    result = 'id="sorted_by_asc"' if params[:sort] == value
    result = 'id="sorted_by_desc"' if params[:sort] == value + "_desc"
  end  

  def sort_link(text, action, value, locals={})
    key = value
    key += "_desc" if params[:sort] == value
    link_to text, :action => action, :sort => key, :locals => locals
  end

  #true or false -> yes or no
  #yes_or_no(1, "Да", "Не")
  #yes_or_no(1, "Yes", "No")
  def yes_or_no(value, yes, no)
    value == 1 ? yes : no
  end
end