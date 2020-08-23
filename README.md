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
- has_many :purchases

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

- has_one :purchases
- belongs_to :user

#category、status、delivery_fee、shipping_address、delivery_dateはActiveHashを利用。

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- has_one :purchases_data
- belongs_to :user
- belongs_to :item

## purchases_data テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_number      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| address          | string     | null: false,                   |
| address_number   | string     | null: false                    |
| house_name       | string     |                                |
| phone_number     | string     | null: false                    |
| purchase         | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase

#prefectureはActiveHashを利用。