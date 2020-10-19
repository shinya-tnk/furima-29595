class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation_day

  validates :name, :description, :price, presence: true
  validates :description, presence: true
  validates :price, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :item_condition_id, numericality: { other_than: 1 }
  validates :postage_type_id, numericality: { other_than: 1 }
  validates :preparation_day_id, numericality: { other_than: 1 }
  validates :prefecture, presence: true

  belongs_to :user
end
