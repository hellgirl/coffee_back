class Order < ApplicationRecord
  enum status: { draft: 'draft', paid: 'paid', prepared: 'prepared' }

  belongs_to :drinks_volume
  belongs_to :user
  has_many :orders_additions
  has_many :drink_additions, through: :orders_additions
end
