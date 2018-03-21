class OrdersAddition < ApplicationRecord
  belongs_to :order
  belongs_to :drink_addition
end
