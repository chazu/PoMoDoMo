class HomeController < ApplicationController
  respond_to :html, :json

  def index
    if current_user
      # TrophyWife::TrophyOfficial.officiate(current_user)
      # raise current_user.trophies.inspect
      @pomodoro = current_user.current_pomodoro
      if @pomodoro.check_time_constraints
        @pomodoro.current_cycle.fail!
        @pomodoro.fail!
      end
    end
  end

end
