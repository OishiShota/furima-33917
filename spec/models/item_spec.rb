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
        expect(@item.errors.full_messages).to include "出品画像を選択してください"
      end
      it "商品名がなければ登録できない" do
        @item.product_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end
      it "商品名が41文字以上だと登録できない" do
        num = "1"
        40.times do |i|
          num2 = "1"
          num = "#{num}"+"#{num2}"
        end
        @item.product_name = "#{num}"
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名は40文字以内で入力してください"
      end
      it "商品の説明がなければ登録できない" do
        @item.product_description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の説明を入力してください"
      end
      it "商品の説明が1001文字以上だと登録できない" do
        num = "1"
        1000.times do |i|
          num2 = "1"
          num = "#{num}"+"#{num2}"
        end
        @item.product_description = "#{num}"
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の説明は1000文字以内で入力してください"
      end
      it "カテゴリーの情報を選択しない場合登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーを選択してください"
      end
      it "商品の状態の情報を選択しない場合登録できない" do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態を選択してください"
      end
      it "配送料の負担の情報を選択しない場合登録できない" do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担を選択してください"
      end
      it "発送元の地域の情報を選択しない場合登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域を選択してください"
      end
      it "発送までの日数の情報を選択しない場合登録できない" do
        @item.preparation_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数を選択してください"
      end
      it "販売価格がない場合登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "価格を入力してください"
      end
      it "販売価格が299円以下の場合登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include "価格は半角数字(300~9999999)で入力してください"
      end
      it "販売価格が10000000円以上の場合登録できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include "価格は半角数字(300~9999999)で入力してください"
      end
      it "販売価格が全角数字の場合登録できない" do
        @item.price = "３３３３"
        @item.valid?
        expect(@item.errors.full_messages).to include "価格は半角数字(300~9999999)で入力してください"
      end
      it "販売価格が英数混合の場合登録できない" do
        @item.price = "a3a3a3"
        @item.valid?
        expect(@item.errors.full_messages).to include "価格は半角数字(300~9999999)で入力してください"
      end
      it "販売価格が半角英語の場合登録できない" do
        @item.price = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include "価格は半角数字(300~9999999)で入力してください"
      end
      it "ユーザーがいない場合登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "ユーザーを入力してください"
      end
    end
  end
end