# frozen_string_literal: true
module Api
  module V1
    class DrinksController < ApplicationController
      def index
        @drinks = Drink.all
      end
    end
  end
end
