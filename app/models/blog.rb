class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  delegate :name, to: :user, allow_nil: true
  validates :body, presence: true

  mount_base64_uploader :photo, PhotoBlogUploader

  ATTRIBUTES_PARAMS = %i(body photo status).freeze
end
