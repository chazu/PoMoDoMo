class AddNameToPomodoro < ActiveRecord::Migration
  def change
    add_column :pomodoros, :name, :string
  end
end
