module ApplicationHelper

  def site_fullname
    "#{Settings.site_name}(#{Settings.site_name_zh})"
  end

  def default_title
    "#{controller_name}/#{action_name}"
  end

  def controller_title
    controller.try(:title) || default_title
  end

  def page_title
    "#{controller_title} - #{site_fullname}"
  end

  def omited_str(str, length=60)
    str.truncate(length, separator: " ", omission: "...")
  end

  def js_alert(message="非常遗憾，操作失败.")
    render js: "alert('#{message}')"
  end

  def js_reload
    render js: "document.location.reload()"
  end

  def js_reload_without_params
    render js: "window.location.href = location.href.split('?')[0]"
  end

  def draw_errors_message(ist_model)
    ist_model.errors.messages.map do |key, ms|
      ms.map do |m|
        info = t("activerecord.attributes.#{ist_model.class.to_s.underscore}")
        path = if info.is_a?(Hash)
          "#{info[key.to_sym]}: " if info.key?(key.to_sym)
        end
        "#{path} #{m}"
      end
    end.flatten
  end

  def post_tags_from_str(str)
    str.split(',').map{|tag| "&nbsp;<a href='#'><span class='badge'>#{tag}</span></a>"}.join.html_safe
  end
end
