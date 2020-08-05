class Item < ApplicationRecord
  belongs_to :user
  
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
    validates :user
  end
end
