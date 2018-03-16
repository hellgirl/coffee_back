# frozen_string_literal: true
module Api
  module V1
    class CoffeeShopsController < Api::ApplicationController
      def index
        @coffee_shops = CoffeeShop.all
      end
    end
  end
end
