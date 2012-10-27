class CreatePomodoros < ActiveRecord::Migration
  def change
    create_table :pomodoros do |t|
      t.integer   :user_id
      t.string    :workflow_state
      t.timestamps
    end
  end
end
