module Expirable
  extend ActiveSupport::Concern

  included do
    attribute :valid_from, :date
    attribute :valid_until, :date

    def active?
      now = Time.zone.now
      return true if self.valid_from.nil? && self.valid_until.nil?
      return true if self.valid_from.nil? && (self.valid_until.present? && self.valid_until > now)
      return true if (self.valid_from.present? && self.valid_from < now) && self.valid_until.nil?
      return true if (self.valid_from.present? && self.valid_from < now) && (self.valid_until.present? && self.valid_until > now)
      false
    end
  end
end
