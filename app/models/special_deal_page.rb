class SpecialDealPage < Obj
  include Expirable

  attribute :title, :string
  attribute :body, :widgetlist
  attribute :child_order, :referencelist
  attribute :tags, :stringlist

end
