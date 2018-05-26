class PaymentsController < ::ApplicationController
  def create
    PaymentProcessor.new(params).process
    render json: { status: 200 }
  end
end
