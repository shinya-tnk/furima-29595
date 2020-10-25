class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :category_id, numericality: { other_than: 1}
    validates :item_condition, numericality: { other_than: 1}
    validates :postage_type, numericality: { other_than: 1}
    validates :prefecture, numericality: { other_than: 0}
    validates :preparation_day, numericality: { other_than: 1}

  end

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :prefecture

end
