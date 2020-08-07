class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
    @category = Category.all
    @status = Status.all
    @area = Area.all
    @deli_fee = DeliFee.all
    @deli_day = DeliDay.all
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :category, :status, :area, :deli_fee, :deli_day).merge(user_id: current_user.id)
  end
end