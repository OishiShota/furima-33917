class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :product_name
    validates :product_description
    validates :category_id
    validates :state_id
    validates :price
    validates :shipping_cost_id
    validates :prefecture_id
    validates :preparation_time_id
    validates :user
    validates :image
  end
end
