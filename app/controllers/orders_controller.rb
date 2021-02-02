class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @address_order = AddressOrder.new
  end
  def create
    @item = Item.find(params[:item_id])
    @address_order = AddressOrder.new(order_params)
    binding.pry
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
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def order_params
    params.require(:address_order).permit(:postal_code, :prefecture_id, :city, :block, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token] )
  end
end
