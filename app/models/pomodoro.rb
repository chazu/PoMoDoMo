class Pomodoro < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  has_many :pomodoro_cycles

  attr_accessible :user_id
  attr_accessible :workflow_state # In Progress, Break
  attr_accessible :name

  def is_active
    this.workflow_state == "In Progress
end
