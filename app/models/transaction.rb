class Transaction < ApplicationRecord
  belongs_to :user
  delegate :name, to: :user, allow_nil: true
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  ATTRIBUTES_PARAMS = %i(latitude longitude).freeze

  def address
    [street, city, zip, state].compact.join(", ")
  end

  def address_changed?
    street_changed? || city_changed? || zip_changed? || state_changed?
  end
end
