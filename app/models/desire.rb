class Desire < ApplicationRecord
  belongs_to :user
  ATTRIBUTES_PARAMS = %i(genre description age_min age_max height_min height_max
    status weight_max weight_min).freeze
  validates :genre, length: {maximum: 40}, allow_nil: true
  validates :description, length: {maximum: 100}, allow_nil: true
  validates :weight_max, presence: true, allow_nil: true
  validates :height_min, presence: true, allow_nil: true
  validates :height_max, presence: true, allow_nil: true
  validates :weight_min, presence: true, allow_nil: true
  validates :age_max, presence: true, allow_nil: true
  validates :age_min, presence: true, allow_nil: true
  enum genre: {male: 0, female: 1}
end
