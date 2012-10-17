class HomeController < ApplicationController
  respond_to :html, :json

  def index
    if current_user
      TrophyWife::TrophyOfficial.officiate(current_user)
      raise current_user.trophies.inspect
    end
  end

end
