class Group < ApplicationRecord
  has_many :users
  has_many :messages

  validates :name, {presence: true, length: {maximum: 30}}
  validates :introduction, presence: true
end
