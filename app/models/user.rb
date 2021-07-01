class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  has_many :comments, dependent: :destroy
  has_many :tasks, dependent: :destroy, foreign_key: :user_id
  has_secure_password
  has_secure_token :authentication_token
  
  validates :name, presence: true, length: { maximum: 35 }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true, on: :create
  
  
  before_save :to_lowercase

  private

    def to_lowercase
      email.downcase!
    end
end
