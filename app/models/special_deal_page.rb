class SpecialDealPage < Obj
  attribute :title, :string
  attribute :body, :widgetlist
  attribute :child_order, :referencelist
  attribute :tags, :stringlist
  attribute :valid_from, :date
  attribute :valid_until, :date

  def valid?
    return true if self.valid_from.presence > Time.zone.now && self.valid_until.presence > Time.zone.now
    false
  end
end
