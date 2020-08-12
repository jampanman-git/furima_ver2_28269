class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal, :city, :house_num, :phone

  with_options presence: true do
    validates :postal
    validates :prefecture_id
    validates :city
    validates :house_num
    validates :phone
  end


  def save

end