# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------    ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| last_name        | string  | null: false |
| first_name       | string  | null: false |
| last_name_kana   | string  | null: false |
| first_name_kana  | string  | null: false |
| birth_day        | date    | null: false |

### Association

- has_many :items
- has_many :order

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| image               | string     | null: false                    |
| name                | string     | null: false                    |
| story               | text       | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| delivery_fee_id     | integer    | null: false                    |
| shipping_address_id | integer    | null: false                    |
| delivery_date_id    | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user

#category_id、status_id、delivery_fee_id、shipping_address_id、delivery_date_idはActiveHashを利用。

## order テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- has_one :order_data
- belongs_to :user
- belongs_to :item

## order_data テーブル

| Column               | Type       | Options                        |
| ---------------------| ---------- | ------------------------------ |
| post_number          | string     | null: false                    |
| shipping_address_id  | integer    | null: false                    |
| address              | string     | null: false,                   |
| address_number       | string     | null: false                    |
| house_name           | string     |                                |
| phone_number         | string     | null: false                    |
| order                | references | null: false, foreign_key: true |

### Association

- belongs_to :order

#prefecture_idはActiveHashを利用。