module Api
  class ApplicationController < ActionController::Base
    include DeviseTokenAuth::Concerns::SetUserByToken
    before_action :set_paper_trail_whodunnit

    respond_to :json

    def user_for_paper_trail
      "User_#{current_user}"
    end
  end
end
