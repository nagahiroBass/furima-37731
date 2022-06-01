class ItemForm
  include ActiveModel::Model

  attr_accessor(:name, :explanation, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :days_to_ship_id, :price,
                :user_id, :image, :id, :created_at, :datetime, :updated_at, :datetime,
              :tag_name)

  validates :name, :explanation, :user_id, :image, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, :condition_id, :days_to_ship_id, :prefecture_id, :shipping_fee_id,
            numericality: { other_than: 1, message: "can't be blank" }

  def save
    item = Item.create(name: name, explanation: explanation, category_id: category_id, condition_id: condition_id,
                shipping_fee_id: shipping_fee_id, prefecture_id: prefecture_id, days_to_ship_id: days_to_ship_id, price: price, user_id: user_id, image: image)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end

  def update(params, item)
    item.item_tag_relations.destroy_all
    tag_name = params.delete(:tag_name)
    tag = Tag.where(tag_name: tag_name).first_or_initialize if tag_name.present?

    tag.save if tag_name.present?
    item.update(params)
    ItemTagRelation.create(item_id: item.id, tag_id: tag.id) if tag_name.present?
  end
end
