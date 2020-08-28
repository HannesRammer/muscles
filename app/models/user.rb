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


  validates_uniqueness_of :email, :username

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  validates :username, presence: true, length: { minimum: 3, maximum: 25 }
  validates :password, presence: true, length: { minimum: 6, maximum: 255 }
  validates :email, presence: true, length: { minimum: 10, maximum: 255 },format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }


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
