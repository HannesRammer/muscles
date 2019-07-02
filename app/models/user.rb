class User < ApplicationRecord
  has_secure_password

  has_many :user_to_exercises, -> { order 'id asc' }
  has_many :exercises, :through => :user_to_exercises

  validates_presence_of :email
  validates_uniqueness_of  :email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
