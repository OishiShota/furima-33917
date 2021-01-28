require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context "商品の出品ができる場合" do
      it "正しく情報を記入すると、商品の出品ができる" do
        expect(@item).to be_valid
      end
    end
    context "商品の出品ができない場合" do
      it "商品画像がなければ登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "商品名がなければ登録できない" do
        @item.product_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Product name can't be blank"
      end
      it "商品名が41文字以上だと登録できない" do
        num = "1"
        40.times do |i|
          num2 = "1"
          num = "#{num}"+"#{num2}"
        end
        @item.product_name = "#{num}"
        @item.valid?
        expect(@item.errors.full_messages).to include "Product name is too long (maximum is 40 characters)"
      end
      it "商品の説明がなければ登録できない" do
        @item.product_description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Product description can't be blank"
      end
      it "商品の説明が1001文字以上だと登録できない" do
        num = "1"
        1000.times do |i|
          num2 = "1"
          num = "#{num}"+"#{num2}"
        end
        @item.product_description = "#{num}"
        @item.valid?
        expect(@item.errors.full_messages).to include "Product description is too long (maximum is 1000 characters)"
      end
      it "カテゴリーの情報を選択しない場合登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it "商品の状態の情報を選択しない場合登録できない" do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "State must be other than 1"
      end
      it "配送料の負担の情報を選択しない場合登録できない" do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping cost must be other than 1"
      end
      it "発送元の地域の情報を選択しない場合登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it "発送までの日数の情報を選択しない場合登録できない" do
        @item.preparation_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Preparation time must be other than 1"
      end
      it "販売価格がない場合登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it "販売価格が299円以下の場合登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than 299"
      end
      it "販売価格が10000000円以上の場合登録できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than 10000000"
      end
      it "販売価格が全角数字の場合登録できない" do
        @item.price = "３３３３"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it "販売価格が英数混合の場合登録できない" do
        @item.price = "a3a3a3"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it "販売価格が半角英語の場合登録できない" do
        @item.price = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
    end
  end
end