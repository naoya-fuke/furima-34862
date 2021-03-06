class Product < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :delivery_fee
    belongs_to :delivery_day
    belongs_to :prefecture
    belongs_to :user
    has_one :record
    has_one_attached :image

    with_options numericality: { other_than: 1, message: 'Select'} do
        validates :category_id
        validates :status_id
        validates :delivery_fee_id
        validates :prefecture_id
        validates :delivery_day_id
    end

    with_options presence: true do
        validates :name
        validates :description
        validates :image
        validates :price
    end
    
    validates :price, numericality: { only_integer: true, message: 'Half-width number' }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'Out of setting range' }
end
