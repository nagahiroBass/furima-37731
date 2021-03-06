class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :days_to_ship
  belongs_to :prefecture
  belongs_to :shipping_fee
  belongs_to :user
  has_one_attached :image

  has_one :order
  has_many :item_tag_relations, dependent: :destroy
  has_many :tags, through: :item_tag_relations
end
