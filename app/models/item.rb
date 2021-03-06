class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one :address
  has_one_attached :image
  
  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40}
    validates :description, length: { maximum: 1000}
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :user
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :area
  belongs_to_active_hash :deli_fee
  belongs_to_active_hash :deli_day

  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :category_id
    validates :status_id
    validates :area_id
    validates :deli_fee_id
    validates :deli_day_id
  end

  #ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :status_id
  validates :area_id
  validates :deli_fee_id
  validates :deli_day_id
  end
end
