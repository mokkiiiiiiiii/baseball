class Reservation < ApplicationRecord
  belongs_to :item
  belongs_to :customer

  
  validates :name, presence: true
end
