class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :groups
  has_many :messages
  
  validates :nickname, length: { minimum: 2, maximum: 20 }, uniqueness: true
end
