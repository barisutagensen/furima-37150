class Item < ApplicationRecord
  has_one_attached :image
  belongs_to       :user
  has_one          :order
  has_many :item_tag_relations, dependent: :destroy
  has_many :tags, through: :item_tag_relations

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefectures
  belongs_to :shipping_fee
  belongs_to :shipping_time
end
