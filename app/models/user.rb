class User < ApplicationRecord
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, last_name: "は全角で入力してください。"}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, first_name: "は全角で入力してください。"}
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, last_name_kana: "は全角カタカナで入力して下さい。"}
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, first_name_kana: "は全角カタカナで入力して下さい。"}
  validates :birthday, presence: true
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A[a-z0-9]+\z/i, password: "は半角英数字で入力してください"}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
