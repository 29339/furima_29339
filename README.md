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
| birth_year       | integer | null: false |
| birth_month      | integer | null: false |
| birth_day        | integer | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item_image | text       | null: false                    |
| items_name | string     | null: false                    |
| item_story | text       | null: false                    |
| price      | integer    | null: false                    |
| user_id    | references | null: false, foreign_kyy: true |

### Association

- has_many :purchases
- belongs_to :users

#カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数のデータははActiveHashを利用。

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_kyy: true |
| item_id | references | null: false, foreign_key: true |

### Association

- has_one :purchases_data
- belongs_to :users
- belongs_to :items

## purchases_data テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| curd_number      | integer    | null: false                    |
| card_limit_month | integer    | null: false                    |
| card_security    | integer    | null: false                    |
| post_number      | integer    | null: false                    |
| address          | string     | null: false,                   |
| address_number   | integer    | null: false                    |
| house_name       | string     |                                |
| phone_number     | integer    | null: false                    |
| purchase_id      | references | null: false, foreign_kyy: true |

### Association

- belongs_to :purchases

#都道府県のデータはActiveHashを利用。