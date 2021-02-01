class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @adress_order = AdressOrder.new
  end
  def create
    @adress_order = AdressOrder.new(order_params)
    if @adress_order.valid?
      @adress_order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def order_params
    params.require(:adress_order).permit(:postal_code, :prefecture_id, :city, :block, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
