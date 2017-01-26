class SpecialDealPage < Obj
  attribute :title, :string
  attribute :body, :widgetlist
  attribute :child_order, :referencelist
  attribute :tags, :stringlist
  attribute :valid_from, :date
  attribute :valid_until, :date
end
