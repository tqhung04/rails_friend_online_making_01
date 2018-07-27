class Conection < ApplicationRecord
  belongs_to :user, optional: true
  scope :find_follow, -> (sender_id, recipient_id) { where(sender_id: sender_id,
  	recipient_id: recipient_id).or(Conection.where(sender_id: recipient_id, recipient_id: sender_id))}
end
