# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| first_name | string | null: false |
| last_name  | string | null: false |
| first_kana | string | null: false |
| last_kana  | string | null: false |
| birthday   | date   | null: false |

### Association

- has_many :items
- has_many :orders
- has_many :addresses
- has_many :cards

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product_name        | string     | null: false                    |
| product_description | text       | null: false                    |
| category_id         | integer    | null: false                    |
| state_id            | integer    | null: false                    |
| price               | integer    | null: false                    |
| postage             | integer    | null: false                    |
| shop_location       | string     | null: false                    |
| preparation_time_id | integer    | null: false                    |
| user_id             | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :order

## adresses テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| postal_code | integer    | null: false                    |
| prefectures | string     | null: false                    |
| city        | string     | null: false                    |
| adress1     | string     | null: false                    |
| adress2     | string     | null: false                    |
| tel         | integer    | null: true                     |
| user_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :prototype

## cards テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| card_token     | string     | null: false                    |
| customer_token | string     | null: false                    |
| user_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item_id    | references | null: false, foreign_key: true |
| user_id    | references | null: false, foreign_key: true |
| card_id    | references | null: false, foreign_key: true |
| address_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :care
- belongs_to :address