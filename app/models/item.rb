class Item < ApplicationRecord
  has_one_attached :image
  belongs_to       :user

  validates :image,             presence: true
  validates :name,             presence: true
  validates :description,      presence: true
  validates :price,            presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :category_id,      numericality: { other_than: 1, message: "を選択してください"}
  validates :condition_id,     numericality: { other_than: 1, message: "を選択してください"}
  validates :shipping_fee_id,  numericality: { other_than: 1, message: "を選択してください"}
  validates :prefectures_id,   numericality: { other_than: 1, message: "を選択してください"}
  validates :shipping_time_id, numericality: { other_than: 1, message: "を選択してください"}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefectures
  belongs_to :shipping_fee
  belongs_to :shipping_time

end
