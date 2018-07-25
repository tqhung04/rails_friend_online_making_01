class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true

  ATTRIBUTES_PARAMS = %i(title body status).freeze
end
