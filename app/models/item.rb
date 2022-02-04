class Item < ApplicationRecord
  has_one_attached :image
  belongs_to       :user

  validates :name,             null: false
  validates :description,      null: false
  validates :price,            null: false
  validates :category_id,      numericality: { other_than: 1, message: "カテゴリーを選択してください"}
  validates :condition_id,     numericality: { other_than: 1, message: "商品の状態を選択してください"}
  validates :shipping_fee_id,  numericality: { other_than: 1, message: "配送料の負担を選択してください"}
  validates :prefectures_id,   numericality: { other_than: 1, message: "発送元の地域を選択してください"}
  validates :shipping_time_id, numericality: { other_than: 1, message: "発送までの日数を選択してください"}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefectures
  belongs_to :shipping_fee
  belongs_to :shipping_time

end
