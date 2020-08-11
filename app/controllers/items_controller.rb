class ItemsController < ApplicationController
  before_action :set_item, only: [:show,:edit,:update]

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
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      @category = Category.all
      @status = Status.all
      @area = Area.all
      @deli_fee = DeliFee.all
      @deli_day = DeliDay.all
      render :new
    end
  end

  def show
  end

  def edit
    @category = Category.all
    @status = Status.all
    @area = Area.all
    @deli_fee = DeliFee.all
    @deli_day = DeliDay.all
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user_id
      item.destroy
      redirect_to root_path
    else
      redirect_to item_path(item)
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :category_id, :status_id, :area_id, :deli_fee_id, :deli_day_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end