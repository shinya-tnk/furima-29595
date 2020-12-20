class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  VALID_ZENKAKU_REGEX = /\A[ぁ-んァ-ンー-龥]/.freeze
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  with_options presence: true do
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i }
    validates :nickname
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :family_name, format: { with: VALID_ZENKAKU_REGEX }
    validates :first_name, format: { with: VALID_ZENKAKU_REGEX }
    validates :family_name_kana, format: { with: VALID_KANA_REGEX }
    validates :first_name_kana, format: { with: VALID_KANA_REGEX }
    validates :birthday
  end
end
