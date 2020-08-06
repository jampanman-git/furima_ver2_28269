class User < ApplicationRecord
  has_many :items
  has_many :orders

  with_options presence: true do
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, last_name: "は全角で入力してください。"}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, first_name: "は全角で入力してください。"}
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, last_name_kana: "は全角カタカナで入力して下さい。"}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, first_name_kana: "は全角カタカナで入力して下さい。"}
    validates :birthday
    validates :nickname 
    validates :email, uniqueness: true
    validates :password, length: { minimum: 6 }, format: { with: /\A[a-z0-9]+\z/i, password: "は半角英数字で入力してください"}
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
