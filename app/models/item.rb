class Item < ApplicationRecord
  belongs_to :user
  
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
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
    validates :title, :integer, :category
    validates :title, :integer, :status
    validates :title, :integer, :area
    validates :title, :integer, :deli_fee
    validates :title, :integer, :deli_day
  end

  #ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :status_is
  validates :area_id
  validates :deli_fee_id
  validates :deli_day_id
  end
end
