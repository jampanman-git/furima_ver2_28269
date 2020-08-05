require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
    @user2 = FactoryBot.build(:user)
    @user3 = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "emailに@を含んでいれば登録できる" do
        @user.email = "a@gmail.com"
        expect(@user).to be_valid
      end

      it "passwordが6文字以上であれば登録できる" do
        @user.password = "00000a"
        @user.password_confirmation = "00000a"
        expect(@user).to be_valid
      end

      it "passwordが半角英数字混合であれば登録できる" do
        @user.password = "000aaa"
        @user.password_confirmation = "000aaa"
        expect(@user).to be_valid
      end

      it "last_nameとfirst_name、last_name_kanaとfirst_name_kana、birthdayがあれば登録できる" do
        expect(@user).to be_valid
      end

      it "last_nameとfirst_nameが全角（漢字・ひらがな・カタカナ）で入力してあれば登録できる" do
        @user.last_name = "阿いウ"
        @user.first_name = "江おカ"
        expect(@user).to be_valid
      end

      it "last_name_kanaとfirst_name_kanaが全角（カタカナ）であれば登録できる" do
        @user.last_name_kana = "アイウ"
        @user.first_name_kana = "エオカ"
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailに＠を含んでいなければ登録できない" do
        @user.email = "abcdefg"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下であれば登録できない" do
        @user.password = "0000a"
        @user.password_confirmation = "0000a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordに半角英数字以外の文字が含まれていたら登録できない" do
        @user.password = "abcd1234あ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation doesn't match Password")
      end

      it "passwordに半角英数字が混合されていなければ登録できない" do
        @user.password = "aaaaaaaaa"
        @user2.password = "11111111"
        @user.valid?
        @user2.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "last_nameが空では登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
      end

      it "last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.last_name = "aaaa"
        @user2.last_name = "1111"
        @user.valid?
        @user2.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it "first_nameが空では登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end

      it "first_name全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.first_name = "aaaa"
        @user2.first_name = "1111"
        @user.valid?
        @user2.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid")
      end

      it "last_name_kanaが全角（カタカナ）でなければ登録できない" do
        @user.last_name_kana = "aaaa"
        @user2.last_name_kana = "ああああ"
        @user3.last_name_kana = "アアアア"
        @user.valid?
        @user2.valid?
        @user3.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
      end

      it "first_name_kanaが全角（カタカナ）でなければ登録できない" do
        @user.first_name_kana = "aaaa"
        @user2.first_name_kana = "ああああ"
        @user3.first_name_kana = "アアアア"
        @user.valid?
        @user2.valid?
        @user3.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "birthdayが空では登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end