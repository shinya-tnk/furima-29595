class Address < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 1 }
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
