module Staff
  class PrepareDrinksController < Staff::ApplicationController
    def create
      @order = Order.paid.find(params.fetch(:order_id))
      @order.update_attributes(status: Order.statuses[:prepared])
    end
  end
end
