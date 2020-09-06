class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :image, :name, :info, :category_id, :items_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, :price, presence: true

  #  validates :price, inclusion: {minimum: 300,maximum: 9999999}
  validates_inclusion_of :price, in: 300..9_999_999

  # validates :price, numericality: { with: 	\d }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delively
end
