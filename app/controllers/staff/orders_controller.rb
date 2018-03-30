module Staff
  class OrdersController < Staff::ApplicationController
    def index
      @break_till = BreakService.new.break_till
      @orders = Order.paid
    end
  end
end
