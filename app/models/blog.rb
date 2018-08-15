class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  delegate :name, to: :user, allow_nil: true
  delegate :avatar, to: :user, allow_nil: true
  validates :body, presence: true

  mount_base64_uploader :photo, PhotoBlogUploader

  ATTRIBUTES_PARAMS = %i(body photo status).freeze

  scope :join_with_connections, -> {
    joins("JOIN conections ON blogs.user_id = conections.sender_id OR blogs.user_id = conections.recipient_id")
  }

  scope :check_conection, ->(user) {
    where("conections.status = true").
    where("conections.sender_id = ?", user.id).
    or(where("conections.recipient_id = ?", user.id))
  }

  scope :ordered_by_created_at, -> {order(created_at: :DESC)}
end
