class PomodorosController < ApplicationController
  respond_to :html, :json, :js
  before_filter :authenticate_user!
  
  before_filter :find_pomodoro, :only => [:show, :start_cycle, :destroy]
  
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
    @pomodoro.fail!
    @pomodoro.current_cycle.fail!

    respond_to do |format|
      format.js
    end
  end
  
  def start_cycle
    @pomodoro.start! unless @pomodoro.in_progress?
    
    @pomodoro.current_cycle.complete! if @pomodoro.current_cycle
    @pomodoro_cycle = @pomodoro.create_new_cycle

    @pomodoro.complete! if @pomodoro.in_progress? && @pomodoro.pomodoro_cycles.length == 8

    respond_to do |format|
      format.js
    end
  end

private
  def find_pomodoro
    @pomodoro = Pomodoro.find params[:id]
  end
end
