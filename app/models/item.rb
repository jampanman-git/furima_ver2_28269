class Item < ApplicationRecord
  belongs_to :user
  
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category
    validates :status
    validates :deli_fee
    validates :area
    validates :deli_day
    validates :price
    validates :user
  end
end
