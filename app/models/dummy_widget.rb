class DummyWidget < Widget

  attribute :title, :string
  attribute :body, :string
  attribute :valid_from, :date
  attribute :valid_until, :date

  def description_for_editor
    "A dummy Widget that can expire"
  end

  def is_valid?
    return true if self.valid_from.presence > Time.zone.now && self.valid_until.presence > Time.zone.now
    false
  end
end
