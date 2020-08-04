require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do

      end
      it "emailに一意性があれば登録できる" do
      end
      it "emailに@を含んでいれば登録できる"
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.nickname = "aaaaaa"
        expect(@user).to be_valid
      end
      it "passwordが半角英数字混合であれば登録できる"
      end
      it "last_nameとfirst_name、last_name_kanaとfirst_name_kana、birthdayがあれば登録できる"
      end
      it "last_nameとfirst_nameが全角（漢字・ひらがな・カタカナ）で入力してあれば登録できる"
      end
      it "last_name_kanaとfirst_name_kanaが全角（カタカナ）であれば登録できる"
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
      end
      it "nicknameが7文字以上であれば登録できない" do
      end
      it "emailが空では登録できない" do
      end
      it "重複したemailが存在する場合登録できない" do
      end
      it "passwordが空では登録できない" do
      end
      it "passwordが5文字以下であれば登録できない" do
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
      end
    end
  end
end