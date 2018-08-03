class Education < ApplicationRecord
  belongs_to :user
  ATTRIBUTES_PARAMS = %i(education status).freeze
  validates :education, length: {maximum: 40}, allow_nil: true
end
