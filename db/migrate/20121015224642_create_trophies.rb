class CreateTrophies < ActiveRecord::Migration
  def change
    create_table :trophies do |t|
      t.string :name
      t.integer :value
      t.text :text

      t.timestamps
    end
  end
end
