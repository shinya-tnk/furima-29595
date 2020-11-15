class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, format: { with: /^[0-9]+$/ } }
  end
  with_options presence: true, numericality: { other_than: 1} do
    validates :category_id
    validates :item_condition_id
    validates :postage_type_id
    validates :prefecture_id
    validates :preparation_day_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :prefecture
end
