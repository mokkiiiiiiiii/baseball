class Item < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :order_details
  belongs_to :member

  has_one_attached :image

  def with_tax_price
    (price * 1.1).floor
  end
end
