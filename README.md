# README

# テーブル設計

## users テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| nickname    | string | null: false |
| last_name   | string | null: false |
| first_name  | string | null: false |
| last_name2  | string | null: false |
| first_name2 | string | null: false |
| password    | string | null: false |
| email       | string | null: false |
| birth_year  | integer| null: false |
| birth_month | integer| null: false |
| birth_day   | integer| null: false |

### Association
- has_many :items
- has_many :transactions

## goods テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| image        | text       | null: false |
| name         | string     | null: false |
| description  | text       | null: false |
| category     | string     | null: false |
| status       | string     | null: false |
| delivery_fee | string     | null: false |
| area         | string     | null: false |
| delivery_day | string     | null: false |
| price        | integer    | null: false |
| user_id      | references | null: false, foreign_key: true |

### Association
- has_one :order
- belongs_to :users

## orders テーブル

| Column     | Type       | Options     |
| ---------- | -------    | ----------- |
| card_num   | integer    | null: false |
| expiration | integer    | null: false |
| postal     | string     | null: false |
| prefecture | string     | null: false |
| city       | string     | null: false |
| address    | string     | null: false |
| building   | string     |             |
| phone      | integer    | null: false |
| good_price | references | null: false, foreign_key: true |
| good_id    | references | null: false, foreign_key: true |
| user_id    | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items