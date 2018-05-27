# frozen_string_literal: true
module Api
  module V1
    class DrinksController < Api::ApplicationController
      def index
        @drinks = Drink.includes(:drinks_volumes, :drink_category).group_by(&:drink_category_id)
      end
    end
  end
end
