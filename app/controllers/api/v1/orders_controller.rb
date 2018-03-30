# frozen_string_literal: true
module Api
  module V1
    class OrdersController < Api::ApplicationController
      before_action :authenticate_user!

      PERMITTED_PARAMS = [:drinks_volume_id, :comment, drink_addition_ids: []].freeze

      def index
        @orders = current_user.orders.group_by(&:status)
      end

      def create
        return if BreakService.new.break_till.present?
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
