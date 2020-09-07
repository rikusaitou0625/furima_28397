class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delively

  # status_id

  validates :image, :name, :info, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :scheduled_delively_id, :price, presence: true
  validates_inclusion_of :price, in: 300..9_999_999

  validates :category_id, :status_id, :shipping_fee_id, :prefecture_id, :scheduled_delively_id, numericality: { other_than: 1 }
end
