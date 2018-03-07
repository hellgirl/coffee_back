class Order < ApplicationRecord
  belongs_to :drinks_volumes
  belongs_to :users
end
