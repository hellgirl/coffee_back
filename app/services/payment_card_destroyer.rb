# frozen_string_literal: true
class PaymentCardDestroyer

  def initialize(user, id)
    @card = user.payment_cards.find(id)
  end

  def destroy
    @card.update_attributes(deleted: true)
  end
end
