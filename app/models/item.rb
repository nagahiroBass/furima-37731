class Item < ApplicationRecord
  extend ActiveHash::Assoiations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :days_to_ship
  belongs_to :prefecture
  belongs_to :shipping_charge
end
