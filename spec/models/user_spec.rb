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
    end
    context '新規登録できないとき' do
      it "nameが空では登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールを入力してください"
      end
      it "emailに@がなければ登録できない" do
        @user.email = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールは不正な値です"
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        user_2 = FactoryBot.build(:user)
        user_2.email = @user.email
        user_2.valid?
        expect(user_2.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end
      it "passwordが英語のみでは登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは半角英数字混合で設定してください"
      end
      it "passwordが数字のみでは登録できない" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは半角英数字混合で設定してください"
      end
      it "passwordが全角では登録できない" do
        @user.password = "aaa11１"
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは半角英数字混合で設定してください"
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end
      it "passwordとpassword_confirmationが一致しなければ登録できない" do
        @user.password = "abc123"
        @user.password_confirmation = "abc321"
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "abc12"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは6文字以上で入力してください"
      end
      it "first_nameがなければ登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字（全角）を入力してください"
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.first_name = "abc12"
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字（全角）は全角文字を使用してください"
      end
      it "last_nameがなければ登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "名前（全角）を入力してください"
      end
      it "last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.last_name = "abc12"
        @user.valid?
        expect(@user.errors.full_messages).to include "名前（全角）は全角文字を使用してください"
      end
      it "first_kanaがなければ登録できない" do
        @user.first_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "フリガナ（苗字）を入力してください"
      end
      it "first_kanaが全角（カタカナ）でなければ登録できない" do
        @user.first_kana = "た中"
        @user.valid?
        expect(@user.errors.full_messages).to include "フリガナ（苗字）は全角カタカナを使用してください"
      end
      it "last_kanaがなければ登録できない" do
        @user.last_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "フリガナ（名前）を入力してください"
      end
      it "last_kanaが全角（カタカナ）でなければ登録できない" do
        @user.last_kana = "た中"
        @user.valid?
        expect(@user.errors.full_messages).to include "フリガナ（名前）は全角カタカナを使用してください"
      end
      it "生年月日がなければ登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "誕生日を入力してください"
      end
    end
  end
end