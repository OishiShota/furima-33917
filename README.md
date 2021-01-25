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

## items テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |
| category | integer    | null: false                    |
| price    | integer    | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_many :orders

## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| prototype | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :customer

## customers テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| prototype | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :prototype