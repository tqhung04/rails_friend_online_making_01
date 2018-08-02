class Email < ApplicationRecord
  before_save :downcase_email
  belongs_to :user
  ATTRIBUTES_PARAMS = %i(email status).freeze
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.maximum.length_email},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}

  private

  def downcase_email
    email.downcase!
  end
end
