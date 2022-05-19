class OrderForm
  include ActiveModel::Model

  attr_accessor :token, :user_id, :item_id, :city, :house_number, :building_name, :postal_code, :phone_number, :prefecture_id

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :city
    validates :house_number
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'はハイフンを入れて7桁の半角文字列で入力してください' }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'はハイフン無し、10〰11桁の半角数字で入力してください'}
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(order_id: order.id, city: city, house_number: house_number, building_name: building_name, postal_code: postal_code, phone_number: phone_number, prefecture_id: prefecture_id)
  end
end
