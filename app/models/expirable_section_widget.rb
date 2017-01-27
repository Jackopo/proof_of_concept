class ExpirableSectionWidget < Widget
  include Expirable

  attribute :content, :widgetlist

  def self.info_text_for_thumbnail
    "A container for a content section, can be scheduled or expire"
  end

  def self.description_for_editor
    "Schedulable/expirable container"
  end
end
