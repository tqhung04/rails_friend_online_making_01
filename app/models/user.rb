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
  has_many :conversations
end
