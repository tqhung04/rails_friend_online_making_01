class Body < ApplicationRecord
  belongs_to :user
  ATTRIBUTES_PARAMS = %i(body weight height status).freeze
  validates :body, length: {maximum: Settings.maximum.length_name}, allow_nil: true
  validates :height, presence: true, allow_nil: true
  validates :weight, presence: true, allow_nil: true
end
