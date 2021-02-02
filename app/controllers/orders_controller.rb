class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :sold_out
  before_action :user_confirmation

  def index
    @address_order = AddressOrder.new
  end
  def create
    @address_order = AddressOrder.new(order_params)
    if @address_order.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: params[:token],
        currency: 'jpy'
      )
      @address_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:address_order).permit(:postal_code, :prefecture_id, :city, :block, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token] )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def user_confirmation
    if @item.user.id == current_user.id
      redirect_to root_path
    end
  end

  def sold_out
    orders = Order.includes(:item)
    orders.each do |order|
      if order.item_id == @item.id 
        redirect_to root_path
      end
    end
  end
end
