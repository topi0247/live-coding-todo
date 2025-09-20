# frozen_string_literal: true

# field_with_errorsの標準的なdivラッパーを無効化
ActionView::Base.field_error_proc = proc do |html_tag, _instance|
  html_tag.html_safe
end