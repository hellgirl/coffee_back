class Order < ApplicationRecord
  enum status: { draft: 'draft', paid: 'paid', prepared: 'prepared' }

  belongs_to :drinks_volume
  belongs_to :user
end
