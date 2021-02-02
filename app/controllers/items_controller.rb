class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :set_orders, only: [:index, :show, :edit, :update, :destroy]
  before_action :user_confirmation, only: [:edit, :update, :destroy]
  before_action :sold_out, only: [:edit, :update, :destroy]
  

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @orders = Order.includes(:item)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to :item
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :product_description, :category_id, :state_id, :price, :shipping_cost_id, :prefecture_id, :preparation_time_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
  def user_confirmation
    unless @item.user.id == current_user.id
      redirect_to root_path
    end
  end

  def set_orders
    @orders = Order.includes(:item)
  end

  def sold_out
    @orders = Order.includes(:item)
    @orders.each do |order|
      if order.item_id == @item.id 
        redirect_to root_path
      end
    end
  end

end