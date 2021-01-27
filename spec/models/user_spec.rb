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
        @user.name = "tanaka"
        expect(@user).to be_valid
      end
      it "passwordとpassword_confirmationが半角英数字混合6文字以上であれば登録できる" do
        @user.password = "abc123"
        @user.password_confirmation = "abc123"
        expect(@user).to be_valid
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.first_name = "あア亞"
        expect(@user).to be_valid
      end
      it "last_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.last_name = "あア亞"
        expect(@user).to be_valid
      end
      it "first_kanaが全角（カタカナ）であれば登録できる" do
        @user.first_kana = "アアア"
        expect(@user).to be_valid
      end
      it "last_kanaが全角（カタカナ）であれば登録できる" do
        @user.last_kana = "アアア"
        expect(@user).to be_valid
      end
      it "生年月日があれば登録できる" do
        @user.birthday = "1999-12-24"
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it "nameが空では登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "emailに@がなければ登録できない" do
        @user.email = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        user_2 = FactoryBot.build(:user)
        user_2.email = @user.email
        user_2.valid?
        expect(user_2.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "passwordとpassword_confirmationが一致しなければ登録できない" do
        @user.password = "abc123"
        @user.password_confirmation = "abc321"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "abc12"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it "first_nameがなければ登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name は全角文字を使用してください"
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.first_name = "abc12"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name は全角文字を使用してください"
      end
      it "last_nameがなければ登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name は全角文字を使用してください"
      end
      it "last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.last_name = "abc12"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name は全角文字を使用してください"
      end
      it "first_kanaがなければ登録できない" do
        @user.first_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First kana は全角カタカナを使用してください"
      end
      it "first_kanaが全角（カタカナ）でなければ登録できない" do
        @user.first_kana = "た中"
        @user.valid?
        expect(@user.errors.full_messages).to include "First kana は全角カタカナを使用してください"
      end
      it "last_kanaがなければ登録できない" do
        @user.last_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last kana は全角カタカナを使用してください"
      end
      it "last_kanaが全角（カタカナ）でなければ登録できない" do
        @user.last_kana = "た中"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last kana は全角カタカナを使用してください"
      end
      it "生年月日がなければ登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end