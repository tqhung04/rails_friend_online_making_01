class User < ApplicationRecord
  has_one :desire
  has_one :email
  has_one :birthday
  has_one :body
  has_one :education
  has_one :config
  has_one :address
  has_many :conections
  has_many :blogs
  has_many :comments
  has_many :photos
  has_many :blocks
  has_many :reports
  has_many :conversations, foreign_key: :sender_id
  has_many :messages

  ATTRIBUTES_PARAMS = %i(name avatar nick_name genre description hobby
    country status password password_confirmation).freeze
  validates :name, presence: true, length: {maximum: 50}
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}

  def self.digest string
    cost =
      if ActiveModel::SecurePassword.min_cost
        BCrypt::Engine::MIN_COST
      else
        BCrypt::Engine.cost
      end
    BCrypt::Password.create string, cost: cost
  end
end
