module Staff
  class OrdersController < Staff::ApplicationController
    def index
      @orders = Order.paid
    end
  end
end
