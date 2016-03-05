module ApplicationHelper
  def gravatar_for user, option = {size: Settings.avatar.size}
    gravatar_id = Digest::MD5::hexdigest user.email.downcase
    size = option[:size]
    gravatar_url = "http://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag gravatar_url, alt: user.name, class: "gravatar"
  end

  def link_to_remove_fields name, f
    f.hidden_field(:_destroy) + link_to(name, "javascript:void(0)",
      onclick: "remove_fields(this)")
  end

  def link_to_add_fields name, f, association
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for association, new_object, child_index:
      "new_#{association}" do |builder|
        render association.to_s.singularize + "_fields", f: builder
      end
    link_to name, "javascript:void(0)", onclick:
      "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"
  end

  def format_time time
    if time.nil?
      "-:-"
    else
      "#{time/60} : #{time%60}"
    end
  end

  def status_label status
    open = "<span class='label label-"
    label = case status
    when "unstart"
      "default"
    when "started"
      "primary"
    when "inprogress"
      "info"
    when "uncheck"
      "warning"
    when "checked"
      "success"
    end
    str = open + label + "'>#{status}</span>"
    str.html_safe
  end
end
