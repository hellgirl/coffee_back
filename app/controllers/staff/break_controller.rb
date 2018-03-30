module Staff
  class BreakController < Staff::ApplicationController
    def create
      break_service = BreakService.new
      break_service.set(params[:break][:time])
      @break_till = break_service.break_till
    end
  end
end
