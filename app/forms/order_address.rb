class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal, :city, :house_num, :phone,:area_id,:building,:user_id,:item_id,:token

  with_options presence: true do
    validates :postal,format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :area_id,numericality: { other_than: 1 } 
    validates :city
    validates :house_num
    validates :phone,length: { maximum: 11},format: {with: /\A[0-9]+\z/}
  end

  def save
    order = Order.create(item_id: @order.item_id, user_id: item.user.id)
    Address.create(postal: postal, area_id: area_id, city: city, house_num: house_num, building: building,phone: phone,order_id: order.id)
  end

end