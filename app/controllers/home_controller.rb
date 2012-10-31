class HomeController < ApplicationController
  respond_to :html, :json

  def index
    if current_user
      # TrophyWife::TrophyOfficial.officiate(current_user)
      # raise current_user.trophies.inspect
      @pomodoro = current_user.current_pomodoro
    end
  end

end
