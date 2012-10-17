class AddUserIdToTrophies < ActiveRecord::Migration
  def change
    add_column :trophies, :user_id, :integer
  end
end
