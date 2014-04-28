class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :votes

  has_secure_password validations: false

  validates :user_name, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: { minimum: 4 }
end