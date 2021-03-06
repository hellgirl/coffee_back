# frozen_string_literal: true
module Api
  module V1
    class DrinkAdditionsController < Api::ApplicationController
      def index
        @drink_additions = DrinkAddition.all
      end
    end
  end
end
