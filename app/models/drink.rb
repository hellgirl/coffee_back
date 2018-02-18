class Drink < ApplicationRecord
  has_many :drinks_volumes
  has_many :volumes, through: :drinks_volumes
end