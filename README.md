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
| birthday    | date   | null: false |


### Association
- has_many :items
- has_many :transactions
- has_many :address

## items テーブル

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
| user         | references | null: false, foreign_key: true |

### Association
- has_one :transaction
- belongs_to :user

## transactions テーブル

| Column     | Type       | Options     |
| ---------- | -------    | ----------- |
| expiration | integer    | null: false |
| postal     | string     | null: false |
| prefecture | string     | null: false |
| city       | string     | null: false |
| address    | string     | null: false |
| building   | string     |             |
| phone      | string     | null: false |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item


## address テーブル
| Column     | Type       | Options     |
| ---------- | -------    | ----------- |
| expiration | integer    | null: false |
| postal     | string     | null: false |
| prefecture | string     | null: false |
| city       | string     | null: false |



### Association
- belongs_to :user