class SpecialDealPageController < CmsController

  before_filter only: :index do
    if !scrivito_in_editable_view? &&
      ((@obj.valid_from && @obj.valid_from > Time.zone.now) ||
      (@obj.valid_until && @obj.valid_until < Time.zone.now))
      render :expired, status: 404
    end
  end
end
