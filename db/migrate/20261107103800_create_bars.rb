class CreateBars < ActiveRecord::Migration[8.1]
  def change
    create_table :bars do |t|
      t.string :name
      t.integer :progress
      t.integer :goal

      t.timestamps
    end
  end
end
