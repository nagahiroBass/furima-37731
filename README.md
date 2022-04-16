# テーブル設計

## users テーブル

| Columun            | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| firstname          | string | null: false               |
| lastname           | string | null: false               |
| firstname_read     | string | null: false               |
| lastname_read      | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shipping_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| days_to_ship_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :images
- belongs_to :category
- belongs_to :condition
- belongs_to :shipping_charge
- belongs_to :prefecture
- belongs_to :days_to_ship
- has_one :order

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- belongs_to :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | references | null: false, foreign_key: true |
| city          | string     | null_false                     |
| house_number  | string     | null_false                     |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :prefecture
- belongs_to :order
