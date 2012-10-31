class Pomodoro < ActiveRecord::Base
  
  # decide on the task to be done
  # set the pomodoro (timer) to 25 minutes
  # work on the task until the timer rings; record with an x
  # take a short break (3-5 minutes)
  # every four "pomodoros" take a longer break (15–30 minutes)  

  # attr_accessible :title, :body
  belongs_to :user
  has_many :pomodoro_cycles

  attr_accessible :user_id
  attr_accessible :workflow_state # In Progress, Break
  attr_accessible :name
  
  validates :name, :presence => true

  include Workflow
  # Chaz, this will help you out with your trophies: https://github.com/geekq/workflow
  workflow do
    state :waiting do
      event :start, :transitions_to => :in_progress
    end
    state :in_progress do
      event :fail, :transitions_to => :failed
      event :complete, :transitions_to => :completed
    end
    state :completed
    state :failed
  end

end
