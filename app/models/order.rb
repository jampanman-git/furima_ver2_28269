class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item

  with_options presence: true do
    validates :item
    validates :user
  end
end
