class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  validates :password, presence: true, format: {with: /\A[a-z0-9]+\z/i }
  validates :nickname, presence: true
  validates :email, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :family_name, presence: true, format: {with: /\A[ぁ-んァ-ンー-龥]/ }
  validates :first_name, presence: true, format: {with:/\A[ぁ-んァ-ンー-龥]/ }
  validates :family_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
end
