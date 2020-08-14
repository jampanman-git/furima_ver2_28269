class OrdersController < ApplicationController
  before_action :not_user, only: [:new]
  # before_action :not_user2, only: [:new]
  # before_action :not_user3, only: [:new]
  def index
  end

  def new
    @order = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = OrderAddress.new(order_params)
   if @order.valid?
    pay_item
     @order.save  # バリデーションをクリアした時
     return redirect_to root_path
   else
     render :new    # バリデーションに弾かれた時
   end
  end

  private

  def order_params
    params.permit(:postal,:area_id,:city,:house_num,:building,:phone).merge(item_id = @item.id,user_id: current_user.id)
  end

  def transaction_params
    params.permit(:token)

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = "pk_test_2ced4f4aced4d3455eb3eac6"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類
    )
  end

  def not_user
    if current_user.id == @item.user_id
      redirect_to item_path(@item.id)
    end
  end

  # def not_user2
  #   unless user_signed_in?
  #     redirect_to item_path(@item.id)
  #   end
  # end

  # def not_user3
  #   if Address exists?(item: @item)
  #     redirect_to root_path
  #   end
  # end
end
