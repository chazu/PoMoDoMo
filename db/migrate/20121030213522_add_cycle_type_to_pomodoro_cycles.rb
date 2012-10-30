class AddCycleTypeToPomodoroCycles < ActiveRecord::Migration
  def change
    add_column :pomodoro_cycles, :cycle_type, :string
  end
end
