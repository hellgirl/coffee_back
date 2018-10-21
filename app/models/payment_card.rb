class PaymentCard < ApplicationRecord
  has_paper_trail

  belongs_to :user

  scope :active, -> { where(deleted: [false, nil]) }
end
