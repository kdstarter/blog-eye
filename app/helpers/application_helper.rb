module ApplicationHelper

  def gravatar_url(email)  
    email_md5 = Digest::MD5.hexdigest(email.downcase)
    # "http://www.gravatar.com/avatar/#{email_md5}?s=120"  
    "http://ruby-eye.qiniudn.com/avatar/#{email_md5}.jpeg"
  end

  def default_title
    "#{controller_name}/#{action_name}"
  end

  def page_title_tag(action_title=nil)
    "<title>#{action_title || default_title} - #{Settings.site_name}</title>".html_safe
  end

end
