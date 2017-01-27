module Expirable
  extend ActiveSupport::Concern

  included do
    attribute :valid_from, :date
    attribute :valid_until, :date

    def active?
      return true if (self.valid_from && self.valid_from < Time.zone.now) && (self.valid_until && self.valid_until > Time.zone.now)
      false
    end
  end
end
