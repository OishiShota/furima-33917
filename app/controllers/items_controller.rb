class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search, :home, :category]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :user_confirmation, only: [:edit, :update, :destroy]
  before_action :sold_out, only: [:edit, :update, :destroy]
  before_action :set_category, only: [:index, :show, :search, :home, :category]

  def index
    @items = Item.includes(:user).order("created_at DESC").limit(3)
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

  def search
    unless params[:keyword] == ""
      @items = SearchItemsService.search(params[:keyword]).order("created_at DESC")
    else
      redirect_to home_items_path
    end
  end

  def home
    @items = Item.includes(:user).order("created_at DESC")
  end

  def category
    unless params[:id] == ""
      @items = CategoryItemsService.category(params[:id]).order("created_at DESC")
    else
      redirect_to home_items_path
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

  def sold_out
    unless @item.order == nil
      redirect_to root_path
    end
  end

  def set_category
    @categories = Category.all
  end
end