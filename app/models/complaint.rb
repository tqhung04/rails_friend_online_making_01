class Complaint < ApplicationRecord
  belongs_to :user
  validates :content, presence: true,
    length: {minimum: Settings.minimum.length_complain,
      maximum: Settings.maximum.length_complain}

  scope :ordered_by_created_at, -> {order(created_at: :DESC)}
end
