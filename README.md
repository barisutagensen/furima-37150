# アプリケーション名

フリマアプリ

# アプリケーション概要

商品の出品を行い、出品した商品を他のユーザーが購入するというフリーマーケットのような仕様のアプリケーション。

# URL

# テスト用アカウント

### Basic認証
*  ID: admin
*  パスワード: 0125
### 購入者用
* メールアドレス: test@com  
* パスワード: test012  
### 購入用カード情報(PAYJPテスト用)
* 番号：4242424242424242  
* 期限：
* セキュリティコード：123
### 出品者用
* メールアドレス名: sample@sample.com
* パスワード: sample012



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
| birth_day          | date    | null: false               |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| shipping_fee_id  | integer    | null: false                    |
| prefectures_id   | integer    | null: false                    |
| shipping_time_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order
- has_many :item_tag_relations
- has_many :tags, through: :item_tag_relations

## ordersテーブル

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_information

## shipping_informationsテーブル

| Column              | Type       | Options                        |
|---------------------|------------|--------------------------------|
| post_code           | string     | null: false                    |
| prefectures_id      | integer    | null: false                    |
| municipalities      | string     | null: false                    |
| address             | string     | null: false                    |
| building_name       | string     |                                |
| telephone_number    | string     | null: false                    |
| order               | references | null: false, foreign_key: true |

### Association
- belongs_to :order

## item_tag_relationsテーブル

| Column | Type       | Options           |
|--------|------------|-------------------|
| item   | references | foreign_key: true |
| tag    | references | foreign_key: true |

### Association
- belongs_to :item
- belongs_to :tag

## tagsテーブル

| Column   | Type   | Options                       |
|----------|--------|-------------------------------|
| tag_name | string | null: false, uniqueness: true |

### Association
- has_many :item_tag_relations
- has_many :items, through: :item_tag_relations