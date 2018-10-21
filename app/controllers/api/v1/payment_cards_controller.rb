# frozen_string_literal: true
module Api
  module V1
    class PaymentCardsController < Api::ApplicationController
      before_action :authenticate_user!

      def index
        @payment_cards = current_user.payment_cards.active
      end

      #TODO return only success or failure
      def destroy
        PaymentCardDestroyer.new(current_user, params.require(:id))
        @payment_cards = current_user.payment_cards.active
      end
    end
  end
end
