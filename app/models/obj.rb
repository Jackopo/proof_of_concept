class Obj < Scrivito::BasicObj

  def self.valid_page_classes_beneath(parent_path)
    [Page, BlogPage, BlogPostPage, SpecialDealPage]
  end

  def valid_widget_classes_for(field_name)
    if %w[body].include?(field_name)
      self.class.section_widgets
    else
      self.class.content_widgets
    end
  end

  def self.content_widgets
    Scrivito.models.widgets.to_a - section_widgets
  end

  def self.section_widgets
    [
      SectionWidget,
      ExpirableSectionWidget,
    ]
  end

  def text_extract
    ""
  end

  def self.description_for_editor
    self.name.underscore.humanize
  end

  def self.thumbnail_image_name
    "thumbnail_#{self.name.underscore}.png"
  end

  def self.info_text_for_thumbnail
    ""
  end

  def expirable?
    return true if self.respond_to?(:valid_from) || self.respond_to?(:valid_from)
    false
  end

  def active?
    return true unless self.expirable?
    self.active?
  end

end
