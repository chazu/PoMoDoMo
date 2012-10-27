class CreatePomodoroCycles < ActiveRecord::Migration
  def change
    create_table :pomodoro_cycles do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer  :pomodoro_id
      t.timestamps
    end
  end
end
