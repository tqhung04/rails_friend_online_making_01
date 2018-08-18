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

  scope :check_conection, -> {
    joins("JOIN conections ON (conversations.sender_id = conections.sender_id
      AND conversations.recipient_id = conections.recipient_id)
      OR (conversations.sender_id = conections.recipient_id
      AND conversations.recipient_id = conections.sender_id)").where("conections.status = true")
  }

  def check_conection?
    cnt = Conection.where("(sender_id = ? AND recipient_id = ?)
      OR (sender_id = ? AND recipient_id = ?)",self.sender_id,
      self.recipient_id, self.recipient_id,self.sender_id).first
    if cnt.present? and cnt&.status?
      return true
    else
      return false
    end
  end
end
