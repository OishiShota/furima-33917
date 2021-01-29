class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :product_name,        null: false
      t.text       :product_description, null: false
      t.integer    :category_id,         null: false
      t.integer    :state_id,            null: false
      t.integer    :price,               null: false
      t.integer    :shipping_cost_id,    null: false
      t.integer    :prefecture_id,       null: false
      t.integer    :preparation_time_id, null: false
      t.references :user,                foreign_key: true

      t.timestamps
    end
  end
end