class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    redirect_to root_path if @item.order.present? || @item.user.id == current_user.id
    @order_shipping_information = OrderShippingInformation.new
  end

  def create
    @order_shipping_information = OrderShippingInformation.new(order_params)
    if @order_shipping_information.valid?
      pay_item
      @order_shipping_information.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shipping_information).permit(:post_code, :prefectures_id, :municipalities, :address, :building_name, :telephone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
