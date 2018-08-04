# frozen_string_literal: true
class PaymentProcessor

  def initialize(data)
    @data = data[:object]
  end

  def process
    order = Order.find(@data["metadata"]["order_id"])
    order.create_payment(yandex_meta: @data)
    user = order.user
    payment_method_id = @data["payment_method"]["id"]
    if card_not_exists?(user, @data["payment_method"]["card"])
      user.payment_cards.create(card_meta: @data["payment_method"]["card"], payment_method_id: payment_method_id,
                                title: @data["payment_method"]["title"], default: true)
    end
    return unless @data["paid"]
    order.update(status: Order.statuses[:paid])
  end

  private

  def card_not_exists?(user, meta)
    user.payment_cards.pluck(:card_meta).none? { |card_meta| card_meta == meta }
  end
end
