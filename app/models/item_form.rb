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
    sent_tags.each do |tag_name|
      tag = Tag.where(tag_name: tag_name).first_or_initialize
      tag.save
      ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
    end
  end

  def save_tag(sent_tags)
    sent_tags.each do |tag_name|
      tag = Tag.where(tag_name: tag_name).first_or_initialize
      tag.save
      ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
    end
    # current_tags = Tag.pluck(:tag_name) unless self.tag_name.nil?
    # old_tags = current_tags - sent_tags
    # new_tags = sent_tags - current_tags

    # old_tags.each do |old_tag|
    #   self.tags.delete Tag.find_by(name: old)
    # end

    # new_tags.each do |new|
    #   new_post_tag = Tag.find_or_create_by(name: new)
    #   self.tags << new_post_tag
    # end


    # tag = Tag.where(tag_name: tag_name).first_or_initialize
    # tag.save
    # ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
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
