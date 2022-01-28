# テーブル設計

## usersテーブル

| Column             | Type    | Options                   |
|--------------------|---------|---------------------------|
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birth_year         | integer | null: false               |
| birth_month        | integer | null: false               |
| birth_day          | integer | null: false               |

### Association

- has_many: items, dependent: :destroy
- has_many: orders, dependent: :destroy

## itemsテーブル

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| name          | string     | null: false                    |
| description   | text       | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| shipping_fee  | integer    | null: false                    |
| shipping_area | integer    | null: false                    |
| shipping_time | integer    | null: false                    |
| price         | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association
- belongs_to: user
- has_one: order, dependent: :destroy

## ordersテーブル

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

### Association
- belongs_to: user
- belongs_to: item
- has_one: shipping_information, dependent: :destroy

## shipping_informationsテーブル

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| post_code        | integer    | null: false                    |
| prefectures      | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | integer    | null: false                    |
| order_id         | references | null: false, foreign_key: true |

### Association
- belongs_to: order
