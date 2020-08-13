class OrdersController < ApplicationController

  def new
    @order = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = OrderAddress.new(order_params)
   if @order.valid?
     @order.save  # バリデーションをクリアした時
     return redirect_to root_path
   else
     render :index    # バリデーションに弾かれた時
   end
  end

  private

  def order_params
    params.permit(:postal,:area_id,:city,:house_num,:building,:phone).merge(user_id: current_user.id)
  end

  # def pay_item
  #   Payjp.api_key = "sk_test_XXXXXXXX"  # PAY.JPテスト秘密鍵
  #   Payjp::Charge.create(
  #     amount: order_params[:price],  # 商品の値段
  #     card: order_params[:token],    # カードトークン
  #     currency:'jpy'                 # 通貨の種類
  #   )
  # end
end
