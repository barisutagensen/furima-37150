class OrderShippingInformation
  include ActiveModel::Model
  attr_accessor :post_code, :prefectures_id, :municipalities, :address, :building_name, :telephone_number, :item_id, :user_id,
                :token, :price

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefectures_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :municipalities
    validates :address
    validates :telephone_number, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    ShippingInformation.create(post_code: post_code, prefectures_id: prefectures_id, municipalities: municipalities,
                               address: address, building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end
end
