class OrdersController < ApplicationController
  before_action :set_item, only: [:new,:create,:pay_item,:not_user,:not_user3]
  before_action :not_user, only: [:new]
  before_action :not_user2, only: [:new]
  before_action :not_user3, only: [:new]
  def index
  end

  def new
    @order = OrderAddress.new
  end

  def create
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
    params.permit(:postal,:area_id,:city,:house_num,:building,:phone,:item_id,:token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_6150f8ebb44d193ad998a4f8"
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token], 
      currency:'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def not_user
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
    if @item.order
      redirect_to root_path
    end
  end
end
