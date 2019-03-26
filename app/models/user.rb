class User < ApplicationRecord
  require 'securerandom'
  has_many :user_videos
  has_many :videos, through: :user_videos

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, if: :password
  validates_presence_of :first_name
  validates_uniqueness_of :uid, :allow_nil => true
  enum role: [:default, :admin]
  has_many :friendships
  has_many :friends, through: :friendships
  has_secure_password

  def set_activation_token
    if activation_token.blank?
       self.update(activation_token: SecureRandom.urlsafe_base64.to_s)
    end
  end
end
