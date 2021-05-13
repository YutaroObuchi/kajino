class Group < ApplicationRecord

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: true }

  has_many :group_users
  has_many :users, through: :group_users
end
