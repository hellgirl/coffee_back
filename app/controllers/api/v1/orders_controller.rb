# frozen_string_literal: true
module Api
  module V1
    class OrdersController < Api::ApplicationController
      before_action :authenticate_user!

      PERMITTED_PARAMS = [:drinks_volume_id, :comment, additions: []].freeze

      def create
        @order = DraftOrderCreator.new(current_user, order_params, DrinkTotalCalculator.new(order_params).total)
          .create
      end

      private

      def order_params
        params.require(:order).permit(*PERMITTED_PARAMS)
      end
    end
  end
end
