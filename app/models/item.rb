class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :days_to_ship
  belongs_to :prefecture
  belongs_to :shipping_charge
  belongs_to :user
  has_one_attached :image

  validates :name, :explanation, :image, presence: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :category_id, :condition_id, :days_to_ship_id, :prefecture_id, :shipping_charge_id, numericality: { other_than: 1  , message: "can't be blank" }
end
