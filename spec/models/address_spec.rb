require 'rails_helper'

describe Address do
  before do
    @address = FactoryBot.build(:address)
  end

  describe 'ユーザー新規登録' do
    context '商品購入がうまくいくとき' do
      it "全ての項目が存在すれば登録できる" do
        expect(@address).to be_valid
      end

      it "buildingが空でも登録できる"
        @address.building = ''
        expect(@address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it "postalが空だと登録できない" do
        @address.postal = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal can't be blank")
      end

      it "postalに-が入っていないと登録できない"
        @address.postal = "1234567"
        expect(@address.errors.full_messages).to include("Postal")
      end

      it "postalが9文字だと登録できない"
        @address.postal = "123-45670"
        expect(@address.errors.full_messages).to include("Postal")
      end

      it "area_idが1だと保存できない" do
        @address.area_id = "1"
        @address.valid?
        expect(@address.errors.full_messages).to include("Area must be other than 1")
      end

      it "cityが空では登録できない" do
        @address.city = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end

      it "house_numがないと登録できない" do
        @address.house_num = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("House Num can't be blank")
      end

      it "phoneが空では登録できない" do
        @order.phone = nil
        @order.valid?
        expect(@address.errors.full_messages).to include("Phone can't be blank", "Price is not a number")
      end
    end
  end
end