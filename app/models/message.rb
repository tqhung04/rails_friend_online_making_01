class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  scope :message_asc, -> {order created_at: :asc}
end
