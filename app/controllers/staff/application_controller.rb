module Staff
  class ApplicationController < ::ApplicationController
    before_action :authenticate_staff_user!
    protect_from_forgery with: :exception
  end
end
