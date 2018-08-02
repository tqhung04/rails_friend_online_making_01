class User < ApplicationRecord
  has_one :desire
  has_one :email
  has_one :birthday
  has_one :body
  has_one :education
  has_one :config
  has_one :address
  has_one :local, foreign_key: :user_id, class_name: Transaction.name
  has_many :conections
  has_many :blogs
  has_many :comments
  has_many :photos
  has_many :blocks
  has_many :reports, foreign_key: :user_id
  has_many :conversations, foreign_key: :sender_id
  has_many :messages

  ATTRIBUTES_PARAMS = %i(name avatar nick_name genre description hobby
    country status password password_confirmation matching isBlocked).freeze
  validates :name, presence: true, length: {maximum: Settings.maximum.length_name}
  has_secure_password
  validates :password, presence: true, length: {minimum: Settings.minimum.length_email}, allow_nil: true

  def turn_on_matching
    update_columns(matching: true)
  end

  def turn_off_matching
    update_columns(matching: false)
  end
end
