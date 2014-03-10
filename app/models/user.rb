class User < ActiveRecord::Base
  
  has_many :surveys

  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  validates :email, uniqueness: true, presence: true
end
