class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_shipping_information = OrderShippingInformation.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_shipping_information = OrderShippingInformation.new(order_params)
    if @order_shipping_information.valid?
      @order_shipping_information.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shipping_information).permit(:post_code, :prefectures_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
