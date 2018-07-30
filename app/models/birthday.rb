class Birthday < ApplicationRecord
  belongs_to :user
  ATTRIBUTES_PARAMS = %i(birthday status).freeze
  validates :birthday, length: {maximum: Settings.maximum.length_name}, allow_nil: true
end
