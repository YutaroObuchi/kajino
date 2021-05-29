class Singleshot < ApplicationRecord
  validates :your_name, presence: true
  validates :partner_name, presence: true
end
