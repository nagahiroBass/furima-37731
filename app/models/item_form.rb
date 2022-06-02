class ItemForm
  include ActiveModel::Model

  attr_accessor(:name, :explanation, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :days_to_ship_id, :price,
                :user_id, :image, :id, :created_at, :datetime, :updated_at, :datetime,
              :tag_name)

  validates :name, :explanation, :user_id, :image, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, :condition_id, :days_to_ship_id, :prefecture_id, :shipping_fee_id,
            numericality: { other_than: 1, message: "can't be blank" }

  def save(sent_tags)
    item = Item.create(name: name, explanation: explanation, category_id: category_id, condition_id: condition_id,
                shipping_fee_id: shipping_fee_id, prefecture_id: prefecture_id, days_to_ship_id: days_to_ship_id, price: price, user_id: user_id, image: image)
    tag_save(sent_tags, item)
  end

  def update(params, item, sent_tags)
    item.item_tag_relations.destroy_all
    tag_name = params.delete(:tag_name)
    item.update(params)
    tag_save(sent_tags, item)
  end

  def tag_save(sent_tags, item)
    sent_tags.each do |tag_name|
      tag = Tag.where(tag_name: tag_name).first_or_initialize
      tag.save
      ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
    end
  end
end
