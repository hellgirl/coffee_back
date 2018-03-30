module Staff
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception

    before_action :authenticate_staff_user!
    before_action :set_paper_trail_whodunnit

    def user_for_paper_trail
      "Staff_#{current_staff_user.id}"
    end
  end
end
