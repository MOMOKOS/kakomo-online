# テーブル設計

## Users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :foods
- has_many :orders

## Foods テーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| name          | string      | null: false                    |
| price         | integer     | null: false                    |
| description   | text        | null: false                    |
| genre_id      | integer     | null: false                    |
| drink_id      | integer     | null: false                    |
| scene_id      | integer     | null: false                    |
| allergy_id    | integer     | null: false                    |
| day_id        | integer     | null: false                    |
| user          | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## Orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| food    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :food
- has_one  :destination

## Destinations テーブル

| Column                    | Type       | Options                            |
| ------------------------- | ---------- | ---------------------------------- |
| post_code                 | string     | null: false                        |
| prefecture_id             | integer    | null: false                        |
| city                      | string     | null: false                        |
| address                   | string     | null: false                        |
| building_name             | string     |                                    |
| phone_number              | string     | null: false                        |
| order                     | references | null: false, foreign_key: true     |

### Association

- belongs_to :order
