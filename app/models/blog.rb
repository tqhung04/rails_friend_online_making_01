class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  delegate :name, to: :user, allow_nil: true
  delegate :avatar, to: :user, allow_nil: true
  validates :body, presence: true

  mount_base64_uploader :photo, PhotoBlogUploader

  ATTRIBUTES_PARAMS = %i(body photo status).freeze

  scope :join_with_conections, -> (user) {
    joins("JOIN conections ON blogs.user_id = conections.sender_id OR
      blogs.user_id = conections.recipient_id").where("conections.status = true").
    where("blogs.user_id != ?", user.id).
    where("conections.sender_id = ? OR conections.recipient_id = ?", user.id, user.id)
  }

  scope :ordered_by_created_at, -> {order(created_at: :DESC)}
end
