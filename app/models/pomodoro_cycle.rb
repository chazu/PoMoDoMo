class PomodoroCycle < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :pomodoro

  attr_accessible :start_time
  attr_accessible :end_time
  attr_accessible :pomodoro_id
  attr_accessible :workflow_state
end
