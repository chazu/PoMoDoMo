class AddWorkflowStateToPomodoroCycle < ActiveRecord::Migration
  def change
    add_column :pomodoro_cycles, :workflow_state, :string
  end
end
