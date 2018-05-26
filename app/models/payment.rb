class Payment < ApplicationRecord
  has_paper_trail

  belongs_to :order
end
