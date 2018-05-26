# frozen_string_literal: true
module Api
  module V1
    class PaymentCardsController < Api::ApplicationController
      before_action :authenticate_user!

      def index
        @payment_cards = current_user.payment_cards
      end
    end
  end
end
