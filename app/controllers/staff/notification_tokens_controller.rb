module Staff
  class NotificationTokensController < Staff::ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      current_staff_user.update_column(:notification_token, params[:notification_token])
    end
  end
end
