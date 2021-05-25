class Housework < ApplicationRecord
  validates :name, presence: true
  validates :score, presence: true
  belongs_to :group
  has_many :calculations
end
