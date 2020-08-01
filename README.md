# README

# テーブル設計

## users テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| nickname    | string | null: false |
| last_name   | string | null: false |
| first_name  | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| password    | string | null: false |
| email       | string | null: false |
| birthday    | date   | null: false |


### Association
- has_many :items
- has_many :orders
- has_one :address

## items テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| image        | text       | null: false |
| name         | string     | null: false |
| description  | text       | null: false |
| category     | string     | null: false |
| price        | integer    | null: false |
| user         | references | null: false, foreign_key: true |

### Association
- has_one :order
- belongs_to :user

### Active Hash
| status       | string     | null: false |
| delivery_fee | string     | null: false |
| area         | string     | null: false |
| delivery_day | string     | null: false |

## orders テーブル

| Column     | Type       | Options     |
| ---------- | -------    | ----------- |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item


## addresses テーブル
| Column     | Type       | Options     |
| ---------- | -------    | ----------- |
| postal     | string     | null: false |
| prefecture | string     | null: false |
| city       | string     | null: false |
| house_num  | string     | null: false |
| building   | string     |             |
| phone      | string     | null: false |
| user       | references | null: false, foreign_key: true |

### Association
- belongs_to :user