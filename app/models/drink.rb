class Drink < ApplicationRecord
  belongs_to :drink_category
  has_many :drinks_volumes, dependent: :destroy
  has_many :volumes, through: :drinks_volumes

  mount_uploader :coffee_image, ::CoffeeImageUploader
end
