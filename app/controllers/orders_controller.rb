class OrdersController < ApplicationController

  def index
  end

  def create
    @order = OrderAddress.new(order_params)

   if @order.valid?
     @order.save  # バリデーションをクリアした時
     return redirect_to root_path
   else
     render "index"    # バリデーションに弾かれた時
   end
  end

  private

  def order_params
    params.require(:order).permit(:postal,:prefecture_id,:city,:house_num,:building,:phone).merge(user_id: current_user.id, item_id: item.id, order_id: order.id)
  end
end
