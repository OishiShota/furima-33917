class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options presence: true do
    validates :user
    validates :item
  end

end
