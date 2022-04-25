# アプリケーション名

フリマアプリ

# アプリケーション概要

商品の出品を行い、出品した商品を他のユーザーが購入するというフリーマーケットのような仕様のアプリケーション。

# URL

AWS EC2によるデプロイ
http://35.77.253.115/

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

# 実装機能

## トップページ

![52c77dd962a27802c23edff82eebbb23](https://user-images.githubusercontent.com/95076051/164466113-cbe578aa-39da-44b6-9a97-81b22eb41443.gif)

## ユーザー管理機能

ユーザーの新規登録、ログイン、ログアウトができます。ユーザー登録することで商品の出品、購入ができるようになります。<br>
ユーザー登録していなくても出品している商品を見ることは可能です。

![41904333a570ef142f9204aa28ced140](https://user-images.githubusercontent.com/95076051/164468003-b8076d0f-7e76-4386-897f-f77956fac770.gif)

## 商品出品機能

商品の情報を登録すると出品できます。金額入力時に販売手数料や販売利益の計算結果が表示されます。

![13e931950c5cb771f8bae1e8f699f2c2](https://user-images.githubusercontent.com/95076051/164469283-d3020b64-9896-4ac5-ac11-1756a7e413ba.gif)


## 商品編集機能

出品した商品の情報を編集することができます。

![03001feee8a50c5069303d885637165b](https://user-images.githubusercontent.com/95076051/164911153-f8d16d76-d193-4cbb-8d7c-be4e899eacd9.gif)

## 商品削除機能

出品した商品を削除することができます。

![d3f235d3f13d6f52e72f707d258d8c53](https://user-images.githubusercontent.com/95076051/165074426-323280d6-7648-49ba-84ff-3846a4fe49a5.gif)

## 商品購入機能

出品者以外であれば商品を購入できます。

![9319248446b3ad32205b2904e8ca049e](https://user-images.githubusercontent.com/95076051/165096390-ffee3ccd-e588-48d0-bc7c-4ad9c07f96cb.gif)


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

## 開発環境　バージョンなど
* Ruby 2.6.5
* Rails 6.0.0
* MySQL 5.6.51
* VScode
