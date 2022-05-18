class Address < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :city, :house_number, presence: true
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'はハイフンを入れて半角文字列で入力してください' }
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: 'はハイフン無しの半角数字で入力してください'}
end
