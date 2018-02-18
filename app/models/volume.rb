class Volume < ApplicationRecord
  has_many :drinks_volumes
  has_many :drinks, through: :drinks_volumes
end