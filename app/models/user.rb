class User < ApplicationRecord
  has_secure_password

  has_many :user_to_exercises, -> { order "id asc" }, :dependent => :destroy
  has_many :exercises, :through => :user_to_exercises

  has_many :trainingsplan_to_users, -> { order "id asc" } , :dependent => :destroy
  has_many :trainingsplans, :through => :trainingsplan_to_users

  has_many :user_to_videos, -> { order "id asc" }, :dependent => :destroy
  has_many :videos, :through => :user_to_videos



  validates_presence_of :email
  validates_uniqueness_of  :email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
