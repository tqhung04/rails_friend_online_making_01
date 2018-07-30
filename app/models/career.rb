class Career < ApplicationRecord
  belongs_to :user
  ATTRIBUTES_PARAMS = %i(job status).freeze
  validates :job, length: {maximum: 40}, allow_nil: true
end
