class Kaji < ApplicationRecord
  validates :name, presence: true
  validates :score, presence: true
  belongs_to :group
end
