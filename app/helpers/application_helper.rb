module ApplicationHelper
  def is_active?(obj)
    obj.active? || (scrivito_in_editable_view? && !obj.active?)
  end
end
