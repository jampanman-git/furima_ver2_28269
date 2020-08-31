class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal, :city, :house_num, :phone,:area_id,:building,:user_id,:item_id,:token

  with_options presence: true do
    validates :postal,length: { maximum: 8 }, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :area_id,numericality: { other_than: 1 } 
    validates :city
    validates :house_num
    validates :phone,length: { maximum: 11},format: {with: /\A[0-9]+\z/}
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal: postal, area_id: area_id, city: city, house_num: house_num, building: building,phone: phone,item_id: item_id)
  end

end