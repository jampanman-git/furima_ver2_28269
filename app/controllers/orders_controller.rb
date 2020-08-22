class OrdersController < ApplicationController
  before_action :not_user, only: [:new]
  before_action :not_user2, only: [:new]
  before_action :not_user3, only: [:new]
  def index
  end

  def new
    @order = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(order_params)
   if @order.valid?
    pay_item
     @order.save
     return redirect_to root_path
   else
     render :new
   end
  end

  private

  def order_params
    params.permit(:postal,:area_id,:city,:house_num,:building,:phone,:item_id).merge(user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_6150f8ebb44d193ad998a4f8"
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token], 
      currency:'jpy'
    )
  end

  def not_user
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to item_path(@item.id)
    end
  end

  def not_user2
    unless user_signed_in?
      redirect_to item_path(@item.id)
    end
  end

  def not_user3
    if Address exists?(item: @item)
      redirect_to root_path
    end
  end
end
