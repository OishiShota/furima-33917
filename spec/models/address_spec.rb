require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @item = FactoryBot.build(:adress)
  end

  describe '商品の出品' do
    context "商品の出品ができる場合" do
      it "正しく情報を記入すると、商品の出品ができる" do
        expect(@adress).to be_valid
      end
    end
    context "商品の出品ができない場合" do
      it "商品画像がなければ登録できない" do
      end
    end
  end
end