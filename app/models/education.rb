class Education < ApplicationRecord
  belongs_to :user
  ATTRIBUTES_PARAMS = %i(education status).freeze
  validates :education, length: {maximum: Settings.maximum.length_report_description}, allow_nil: true
end
