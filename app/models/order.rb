class Order < ApplicationRecord
    
  has_many :cart_items #中間テーブル
  has_many :items, through: :cart_items  #注文には商品が多くある
  enum payment_method: { クレジットカード: 0, 現金: 1 }
  has_many :order_details
  has_many :ordered_items, through: :order_details, source: :item

  belongs_to :customer
  
  scope :with_ordered_items, -> { joins(:ordered_items) }
  # scope :only_member, -> (member) { with_ordered_items.where(ordered_items: { member_id: member.id }) }
  scope :only_member, -> (member) { with_ordered_items.merge(Item.where(member_id: member.id)) }
end
