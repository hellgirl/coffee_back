# frozen_string_literal: true
module Api
  module V1
    class DrinkCategoriesController < Api::ApplicationController
      def index
        @drink_categories = DrinkCategory.all
      end
    end
  end
end
