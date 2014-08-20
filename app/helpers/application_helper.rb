module ApplicationHelper

  def default_title
    "#{controller_name}/#{action_name}"
  end

  def page_title_tag(action_title=nil)
    "<title>#{Settings.site_name}(#{Settings.site_name_zh}) - #{action_title || default_title}</title>".html_safe
  end

  def omited_str(str, length=60)
    str.truncate(length, separator: ' ', omission: '...')
  end

end
