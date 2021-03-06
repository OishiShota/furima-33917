require 'rails_helper'

RSpec.describe AddressOrder, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @address_order = FactoryBot.build(:address_order, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '購入情報の登録' do
    context "購入手続きができる場合" do
      it "正しく情報を記入すると、商品の出品ができる" do
        expect(@address_order).to be_valid
      end
      it "建物名が空欄でも登録ができる" do
        @address_order.building = ""
        expect(@address_order).to be_valid
      end
    end
    context "購入手続きができない場合" do
      it "郵便番号がないと登録できない" do
        @address_order.postal_code = ""
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("郵便番号を入力してください")
      end
      it "郵便番号にハイフンがないと登録できない" do
        @address_order.postal_code = "1111111"
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("郵便番号はハイフン（-）を使用して入力してください")
      end
      it "都道府県を選択しないと登録できない" do
        @address_order.prefecture_id = 1
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("都道府県を選択してください")
      end
      it "市区町村がないと登録できない" do
        @address_order.city = ""
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("市区町村を入力してください")
      end
      it "番地がないと登録できない" do
        @address_order.block= ""
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("番地を入力してください")
      end
      it "電話番号がないと登録ができない" do
        @address_order.tel= ""
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("電話番号を入力してください")
      end
      it "電話番号が全角数字だと登録ができない" do
        @address_order.tel= "０９００１２３４５６７"
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("電話番号は11桁までの半角数字で入力してください")
      end
      it "電話番が英数字混合だと登録ができない" do
        @address_order.tel= "abc123"
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("電話番号は11桁までの半角数字で入力してください")
      end
      it "電話番が12桁以上だと登録ができない" do
        num = "1"
        11.times do |i|
          num2 = "1"
          num = "#{num}"+"#{num2}"
        end
        @address_order.tel= "#{num}"
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("電話番号は11桁までの半角数字で入力してください")
      end
      it "user_idがないと登録ができない" do
        @address_order.user_id = ""
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("ユーザーを入力してください")
      end
      it "item_idがないと登録ができない" do
        @address_order.item_id = ""
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("商品を入力してください")
      end
    end
  end
end