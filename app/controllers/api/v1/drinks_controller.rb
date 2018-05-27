# frozen_string_literal: true
module Api
  module V1
    class DrinksController < Api::ApplicationController
      def index
        category_id = params[:drink_category_id]
        @drinks = category_id.present? ? drinks.where(drink_category_id: category_id) : drinks
      end

      private

      def drinks
        Drink.includes(:drinks_volumes)
      end
    end
  end
end
