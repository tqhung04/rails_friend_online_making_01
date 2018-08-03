class Birthday < ApplicationRecord
  belongs_to :user
  ATTRIBUTES_PARAMS = %i(birthday status).freeze
  validates :birthday, length: {maximum: 40}, allow_nil: true
end
