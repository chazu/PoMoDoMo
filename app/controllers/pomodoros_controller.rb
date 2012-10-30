class PomodorosController < ApplicationController
  respond_to :html, :json, :js
  before_filter :authenticate_user!
  
  before_filter :find_pomodoro, :only => [:show, :start_cycle]
  
  def index
    @pomodoros = Pomodoro.all
    respond_with @pomodoros
  end

  def show
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
  
  def start_cycle
    @pomodoro.start! unless @pomodoro.in_progress?

    @pomodoro_cycle = @pomodoro.pomodoro_cycles.create(:start_time => DateTime.now, :end_time => DateTime.now + 25.minutes)

    respond_to do |format|
      format.js
    end
  end

private
  def find_pomodoro
    @pomodoro = Pomodoro.find params[:id]
  end
end
