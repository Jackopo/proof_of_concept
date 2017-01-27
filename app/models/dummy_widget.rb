class DummyWidget < Widget
  include Expirable

  attribute :title, :string
  attribute :body, :string

  def description_for_editor
    "A dummy Widget that can expire"
  end
end
