class PomodorosController < ApplicationController
  respond_to :html, :json, :js
  
  def index
    @pomodoros = Pomodoro.all
    respond_with @pomodoros
  end

  def new
  end

  def create
  end

  def show
    @pomodoro = Pomodoro.find(params[:id])
    respond_with @pomodoro
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
