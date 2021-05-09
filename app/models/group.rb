class Group < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: true }
end
