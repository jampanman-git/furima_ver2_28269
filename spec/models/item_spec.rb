require 'rails_helper'
describe User do
  before do
    @item = FactoryBot.build(:item)
    @item2 = FactoryBot.build(:item)
  end

  describe 'ユーザー新規登録' do
    context '商品出品がうまくいくとき' do
      it "全ての項目が存在すれば登録できる" do
        expect(@item).to be_valid
      end

      it "imageを含んでいれば登録できる" do
        @item.image = ""
        expect(@item).to be_valid
      end

      it "nameを含んでいれば登録できる" do
        @item.name = "あああ"
        expect(@item).to be_valid
      end

      it "descriptionを含んでいれば登録できる" do
        @item.description = "あああ"
        expect(@item).to be_valid
      end

      it "priceが入力されていれば登録できる" do
        @item.price = "300"
        expect(@item).to be_valid
      end

      it "categoryが選ばれていれば登録できる" do
        @item.cattegory_id = "2"
        expect(@item).to be_valid
      end

      it "statusが選ばれていれば登録できる" do
        @item.status_id = "2"
        expect(@item).to be_valid
      end

      it "areaが選ばれていれば登録できる" do
        @item.area_id = "2"
        expect(@item).to be_valid
      end

      it "deli_feeが選ばれていれば登録できる" do
        @item.deli_fee_id = "2"
        expect(@item).to be_valid
      end

      it "deli_dayが選ばれていれば登録できる" do
        @item.deli_day_id = "2"
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "imageが空だと登録できない" do
        @item.image = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "nameが空では登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "descriptionがないと登録できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "priceが空では登録できない" do
        @item.price =
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "status_idが1だと保存できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status_id ")
      end

      it "status_idが1だと保存できない" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area_id ")
      end

      it "category_idが1だと保存できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category_id ")
      end

      it "deli_fee_idが1だと保存できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("DeliFee_id ")
      end

      it "status_idが1だと保存できない" do
        @item.deli_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("DEliDay_id ")
      end

      it "priceが300未満だと保存できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price ")
      end

      it "priceが9999999より高いと保存できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price ")
      end

      it "nameが40字より多いと保存できない" do
        @item.name.length = 41
        @item.valid?
        expect(@item.errors.full_messages).to include("Name ")
      end

      it "descriptionが1000字より多いと保存できない" do
        @item.description.length = 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Description ")
      end
    end
  end
end