# Specify the proc used to decorate input tags that refer to attributes with errors.
Rails.application.config.action_view.field_error_proc = Proc.new {
  |html_tag, instance| "<div class=\"has-error\">#{html_tag}</div>".html_safe
}
