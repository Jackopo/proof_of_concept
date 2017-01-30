module Expirable
  extend ActiveSupport::Concern

  included do
    attribute :valid_from, :date
    attribute :valid_until, :date

    def active?
      now = Time.zone.now
      return true if now.between? (self.valid_from || now), (self.valid_until || now)
      false
    end
  end
end
