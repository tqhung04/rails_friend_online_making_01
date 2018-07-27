class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :sender, foreign_key: :sender_id, class_name: User.name
  belongs_to :recipient, foreign_key: :recipient_id, class_name: User.name

  validates :sender_id, uniqueness: { scope: :recipient_id }

  scope :between, -> (sender_id, recipient_id) {
    where(sender_id: sender_id, recipient_id: recipient_id).or(
      where(sender_id: recipient_id, recipient_id: sender_id)
  )}

  scope :get_all, -> (sender_id) {where(sender_id: sender_id).or(where(recipient_id: sender_id))}
end
