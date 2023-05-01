class Reservation < ApplicationRecord
  belongs_to :item
  belongs_to :customer

enum status: {
     "発送準備中":0, "発送済":1
  }
  
  validates :name, presence: true
end
