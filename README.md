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
| birth_year       | date    | null: false |
| birth_month      | date    | null: false |
| birth_day        | date    | null: false |

### Association

- has_many :items
- has_many :purchases

#birth_year,birth_month,birth_dayはActiveHashを利用。

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| image            | text       | null: false                    |
| name             | string     | null: false                    |
| story            | text       | null: false                    |
| category         | string     | null: false                    |
| status           | string     | null: false                    |
| delivery_fee     | string     | null: false                    |
| shipping_address | string     | null: false                    |
| delivery_date    | string     | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- has_many :purchases
- belongs_to :users

#category、status、delivery_fee、shipping_address、delivery_dateはActiveHashを利用。

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- has_one :purchases_data
- belongs_to :users
- belongs_to :items

## purchases_data テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_number      | string     | null: false                    |
| prefecture       | string     | null: false                    |
| address          | string     | null: false,                   |
| address_number   | integer    | null: false                    |
| house_name       | string     |                                |
| phone_number     | string     | null: false                    |
| purchase         | references | null: false, foreign_key: true |

### Association

- belongs_to :purchases

#prefectureはActiveHashを利用。