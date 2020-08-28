class User < ApplicationRecord
  has_secure_password

  has_many :user_to_exercises, -> { order "id asc" }, :dependent => :destroy
  has_many :exercises, :through => :user_to_exercises

  has_many :trainingsplan_to_users, -> { order "id asc" }, :dependent => :destroy
  has_many :trainingsplans, :through => :trainingsplan_to_users

  has_many :user_to_videos, -> { order "id asc" }, :dependent => :destroy
  has_many :videos, :through => :user_to_videos

  has_many :following_relationship, foreign_key: :follower_id
  has_many :followed_user, through: :following_relationship


  validates_presence_of :email
  validates_uniqueness_of :email
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}

  def generate_password_token!
    self.reset_password_token = generate_token
    self.reset_password_sent_at = Time.now.utc
    save!
  end

  def password_token_valid?
    (self.reset_password_sent_at + 4.hours) > Time.now.utc
  end

  def reset_password!(password)
    self.reset_password_token = nil
    self.password = password
    save!
  end
  def follow(user)
    followed_user << user
  end
  def unfollow(user)
    followed_user.delete(user)
  end
  def following?(user)
    followed_user_ids.include?(user.id)
  end

  private

  def generate_token
    SecureRandom.hex(10)
  end


end
