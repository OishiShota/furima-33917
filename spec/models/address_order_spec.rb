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
        expect(@address_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "都道府県を選択しないと登録できない" do
        @address_order.prefecture_id = "0"
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "市区町村がないと登録できない" do
        @address_order.city = ""
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("City can't be blank")
      end
      it "番地がないと登録できない" do
        @address_order.block= ""
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Block can't be blank")
      end
      it "電話番号がないと登録ができない" do
        @address_order.tel= ""
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Tel can't be blank")
      end
    end
  end
end