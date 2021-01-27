class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :product_name
    validates :product_description
    validates :price
    validates :user
    validates :image
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :preparation_time_id
  end
end
