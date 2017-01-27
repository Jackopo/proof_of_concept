class ImageWidget < Widget
  include Expirable
  
  attribute :image, :reference
  attribute :show_in_lightbox, :enum, values: %w[yes no], default: "no"

  def show_in_lightbox?
    show_in_lightbox == "yes"
  end

  def self.info_text_for_thumbnail
    "A widget with an image."
  end

end
