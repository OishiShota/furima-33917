# テーブル設計

## users テーブル

| Column             | Type   | Options                                            |
| ------------------ | ------ | -------------------------------------------------- |
| email              | string | null: false, uniqueness: { case_sensitive: false } |
| encrypted_password | string | null: false                                        |
| first_name         | string | null: false                                        |
| last_name          | string | null: false                                        |
| first_kana         | string | null: false                                        |
| last_kana          | string | null: false                                        |
| birthday           | date   | null: false                                        |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product_name        | string     | null: false                    |
| product_description | text       | null: false                    |
| category_id         | integer    | null: false                    |
| state_id            | integer    | null: false                    |
| price               | integer    | null: false                    |
| postage             | integer    | null: false                    |
| prefectures_id      | integer    | null: false                    |
| preparation_time_id | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## adresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefectures_id | string     | null: false                    |
| city           | string     | null: false                    |
| block          | string     | null: false                    |
| building       | string     | null: false                    |
| tel            | string     | null: true                     |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :order

## orders テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item