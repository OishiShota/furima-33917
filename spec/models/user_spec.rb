require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it "正しく情報を記入すると、ユーザーの新規登録ができる" do
        expect(@user).to be_valid
      end
      it "nameがあれば登録できる" do
        @user.name = "marii"
        expect(@user).to be_valid
      end
      it "passwordとpassword_confirmationが半角英数字混合6文字以上であれば登録できる" do
        @user.password = "abc123"
        @user.password_confirmation = "abc123"
        expect(@user).to be_valid
      end
    end
    # context '新規登録できないとき' do
    #   it "nicknameが空では登録できない" do
    #     @user.nickname = ""
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include "Nickname can't be blank"
    #   end
    #   it "emailが空では登録できない" do
    #     @user.email = ""
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include "Email can't be blank"
    #   end
    #   it "passwordが空では登録できない" do
    #     @user.password = ""
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include "Password can't be blank"
    #   end
    #   it "passwordが存在してもpassword_confirmationが空では登録できない" do
    #     @user.password_confirmation = ""
    #     @user.valid?
    #     # binding.pry
    #     expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    #   end
    #   it "nicknameが7文字以上では登録できない" do
    #     @user.nickname = "aaaaaaa"
    #     @user.valid?
    #     # binding.pry
    #     expect(@user.errors.full_messages).to include "Nickname is too long (maximum is 6 characters)"
    #   end
    #   it "重複したemailが存在する場合登録できない" do
    #     @user.save
    #     user_2 = FactoryBot.build(:user)
    #     user_2.email = @user.email
    #     user_2.valid?
    #     # binding.pry
    #     expect(user_2.errors.full_messages).to include("Email has already been taken")
    #   end
    #   it "passwordが5文字以下では登録できない" do
    #     @user.password = "aaaaa"
    #     @user.password_confirmation = @user.password
    #     @user.valid?
    #     # binding.pry
    #     expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    #   end
    # end
  end
end