class User < ApplicationRecord
  has_many :items
  has_many :orders

  with_options presence: true do
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message:"last_nameは全角で入力してください。"}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "first_nameは全角で入力してください。"}
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "last_name_kanaは全角カタカナで入力して下さい。"}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "first_name_kanaは全角カタカナで入力して下さい。"}
    validates :birthday
    validates :nickname 
    validates :email, uniqueness: true
    validates :password, length: { minimum: 6 }, format: { with: /\A[a-z0-9]+\z/i, message: "passwordは半角英数字で入力してください"}
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
