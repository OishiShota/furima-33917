class AddressOrder
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :prefecture_id, :city, :block, :building, :tel, :order_id

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :city
    validates :block
    validates :postal_code
    validates :tel
  end

  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "はハイフン（-）を使用して入力してください"}
  validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :tel, format: { with: /\A[0-9]{1,11}\z/, message: "は11桁までの半角数字で入力してください"}

  def save
    order = Order.create(user_id: user_id, item_id: @item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building, tel: tel, order_id: order.id)
  end
end