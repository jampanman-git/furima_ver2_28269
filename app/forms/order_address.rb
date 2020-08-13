class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal, :city, :house_num, :phone

  with_options presence: true do
    validates :postal
    validates :area_id,numericality: { other_than: 1 } 
    validates :city
    validates :house_num
    validates :phone　
  end

  def save
    order = Order.create(item_id: item_id, user_id: user)
    Address.create(postal: postal, area_id: area_id, city: city, house_num: house_num, building: building,phone: phone,order_id: order.id)
  end

end