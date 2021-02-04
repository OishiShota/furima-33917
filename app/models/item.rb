class Item < ApplicationRecord

  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :preparation_time

  validates :product_name, presence:true, length:{maximum: 40}
  validates :product_description, presence:true, length:{maximum: 1000}
  validates :price, presence:true, numericality: {only_integer: true, greater_than: 299, less_than: 10000000, message: "は半角数字(300~9999999)で入力してください" }

  validates :image, presence: { message: "を選択してください" }

  with_options numericality: { other_than: 1, message: "を選択してください" } do
    validates :category_id
    validates :state_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :preparation_time_id
  end
end
