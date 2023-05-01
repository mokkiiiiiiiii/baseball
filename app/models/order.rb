class Order < ApplicationRecord
    
  has_many :cart_items #中間テーブル
  has_many :items, through: :cart_items  
  enum payment_method: { クレジットカード: 0, 現金: 1 }
  has_many :order_details
  has_many :ordered_items, through: :order_details, source: :item
  
  enum status: {
     "入金待ち":0, "入金確認":1, "発送準備中":2, "発送済":3
  }

  belongs_to :customer
  
  scope :with_ordered_items, -> { joins(:ordered_items) }
  scope :only_member, -> (member) { with_ordered_items.merge(Item.where(member_id: member.id)) }
end
