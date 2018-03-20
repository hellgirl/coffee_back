class DraftOrderCreator
  def initialize(user, params, total)
    @user = user
    @params = params
    @total = total
  end

  def create
    Order.create(@params.merge(user_id: @user.id, status: Order.statuses[:draft], code: order_code,
                               total: @total))
  end

  private

  def order_code
    SecureRandom.urlsafe_base64(4)
  end
end
