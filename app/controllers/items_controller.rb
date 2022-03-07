class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item,           only: [:show, :edit, :update, :destroy]
  before_action :move_to_index,      except: [:index, :show, :new, :create]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item_form = ItemForm.new
  end

  def create
    @item_form = ItemForm.new(item_form_params)
    if @item_form.valid?
      @item_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path if @item.order.present?
    item_attributes = @item.attributes
    @item_form = ItemForm.new(item_attributes)
  end

  def update
    @item_form = ItemForm.new(item_form_params)

    @item_form.image ||= @item.image.blob
    if @item_form.valid?
      @item_form.update(item_form_params, @item)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_form_params
    params.require(:item_form).permit(:name, :image, :description, :category_id, :condition_id, :shipping_fee_id, :prefectures_id,
                                 :shipping_time_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless @item.user_id == current_user.id
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
