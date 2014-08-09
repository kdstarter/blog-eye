module ApplicationHelper
  def default_title
    "#{controller_name}/#{action_name}"
  end

  def page_title_tag(action_title=nil)
    "<title>#{action_title || default_title} - #{Settings.site_name}</title>".html_safe
  end

end
