class PomodorosController < ApplicationController
  respond_to :html, :json, :js
  before_filter :authenticate_user!
  
  def index
    @pomodoros = Pomodoro.all
    respond_with @pomodoros
  end

  def show
    @pomodoro = Pomodoro.find(params[:id])
    respond_with @pomodoro
  end

  def new
    @pomodoro = Pomodoro.new

    respond_to do |format|
      format.js
    end
  end

  def create
    @pomodoro = current_user.pomodoros.build params[:pomodoro]
    if @pomodoro.save
      respond_with @pomodoro, :location => pomodoro_path(@pomodoro)
    else
      flash[:alert] = "Failed to create pomodoro"
      render :new
    end
  end

  def edit
  end
  
  def update
  end

  def destroy
  end
end
