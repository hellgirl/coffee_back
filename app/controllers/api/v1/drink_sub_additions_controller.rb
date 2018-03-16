# frozen_string_literal: true
module Api
  module V1
    class DrinkSubAdditionsController < Api::ApplicationController
      def index
        @drink_sub_additions = DrinkSubAddition.all
      end
    end
  end
end
