module DeviseHelper
  # A simple way to show error messages for the current devise resource. If you need
  # to customize this method, you can either overwrite it in your application helpers or
  # copy the views to your application.
  #
  # This method is intended to stay simple and it is unlikely that we are going to change
  # it to add more behavior or options.
  def resource
    instance_variable_get(:"@#{resource_name}")
  end
  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML

<div id="alert" class="alert alert-danger">
<h4>#{sentence}</h4>
<ul class="list-inline">
#{messages}
</ul>
</div>
<!--div id="error_explanation"></div-->
    HTML

    html.html_safe
  end
end