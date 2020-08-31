require 'rails_helper'
describe OrderAddress do
  before do
    @order = FactoryBot.build(:order_address)
  end

  describe 'ユーザー新規登録' do
    context '商品購入がうまくいくとき' do
      it "全ての項目が存在すれば登録できる" do
        expect(@order).to be_valid
      end

      it "buildingが空でも登録できる"
        @order.building = ''
        expect(@order).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it "postalが空だと登録できない" do
        @order.postal = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal can't be blank")
      end

      it "postalに-が入っていないと登録できない"
        @order.postal = "1234567"
        expect(@order.errors.full_messages).to include("Postal")
      end

      it "postalに全角があると登録できない"
        @order.postal = "１23-4567"
        expect(@order.errors.full_messages).to include("Postal")
      end

      it "area_idが1だと保存できない" do
        @order.area_id = "1"
        @order.valid?
        expect(@order.errors.full_messages).to include("Area must be other than 1")
      end

      it "cityが空では登録できない" do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it "house_numがないと登録できない" do
        @order.house_num = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("House Num can't be blank")
      end

      it "phoneが空では登録できない" do
        @order.phone = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone can't be blank", "Price is not a number")
      end
    end
  end
end