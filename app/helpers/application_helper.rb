module ApplicationHelper
  def field_error_message(model, field)
    return unless model&.errors && model.errors[field].any?

    content_tag :span, model.errors[field].first, class: "text-red-500 text-sm mt-1 block"
  end
end
