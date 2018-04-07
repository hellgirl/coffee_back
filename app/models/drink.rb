class Drink < ApplicationRecord
  has_many :drinks_volumes, dependent: :destroy
  has_many :volumes, through: :drinks_volumes

  mount_uploader :coffee_image, ::CoffeeImageUploader
end
