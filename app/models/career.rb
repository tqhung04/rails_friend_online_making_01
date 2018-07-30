class Career < ApplicationRecord
  belongs_to :user
  ATTRIBUTES_PARAMS = %i(job status).freeze
  validates :job, length: {maximum: Settings.maximum.length_report_description}, allow_nil: true
end
