class PomodoroCycle < ActiveRecord::Base
  # attr_accessible :title, :body
  CYCLE_TYPES = ['work', 'break']

  belongs_to :pomodoro

  attr_accessible :start_time
  attr_accessible :end_time
  attr_accessible :pomodoro_id
  attr_accessible :workflow_state
  attr_accessible :cycle_type
  
  include Workflow
  # https://github.com/geekq/workflow
  workflow do
    state :in_progress do
      event :fail, :transitions_to => :failed
      event :complete, :transitions_to => :completed
    end
    state :completed
    state :failed
  end
end
