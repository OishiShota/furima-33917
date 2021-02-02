class AddressOrder
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :prefecture_id, :city, :block, :building, :tel, :order_id

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :city
    validates :block
  end

  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :tel, format: { with: /\A[0-9]{1,11}\z/}

  def save
    order = Order.create(user_id: user_id, item_id: @item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building, tel: tel, order_id: order.id)
  end
end