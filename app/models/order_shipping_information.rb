class OrderShiippingInformation

  include ActiveModel::Model
  attr_accessor :post_code, :prefectures_id, :municipalities, :address, :building_name, :telephone_number, :item_id, :user_id

  with_options presence: true do
    validates :post_code
    validates :prefectures_id
    validates :municipalities
    validates :address
    validates :telephone_number
    validates :order_id
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Shippinginformation.create(post_code: post_code, prefectures_id: prefectures_id, municipalities: municipalities, address: address, building_name: building_name, telephone_number: telephone_number order_id: order_id)
  end
end