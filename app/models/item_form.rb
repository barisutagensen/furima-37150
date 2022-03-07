class ItemForm
  include ActiveModel::Model

  attr_accessor(
      :name, :image, :description, :category_id, :condition_id, :shipping_fee_id, :prefectures_id, :shipping_time_id, :price, :user_id,
      :id, :created_at, :updated_at, :datetime
   )

  validates :image, presence: true
  validates :name,             presence: true
  validates :description,      presence: true
  validates :category_id,      numericality: { other_than: 1, message: 'を選択してください' }
  validates :condition_id,     numericality: { other_than: 1, message: 'を選択してください' }
  validates :shipping_fee_id,  numericality: { other_than: 1, message: 'を選択してください' }
  validates :prefectures_id,   numericality: { other_than: 1, message: 'を選択してください' }
  validates :shipping_time_id, numericality: { other_than: 1, message: 'を選択してください' }
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  def save
    Item.create(name: name, description: description, category_id: category_id, condition_id: condition_id,shipping_fee_id: shipping_fee_id, prefectures_id: prefectures_id, shipping_time_id: shipping_time_id, price: price, user_id: user_id, image: image)
  end

  def update(params, item)
    item.update(params)
  end
end