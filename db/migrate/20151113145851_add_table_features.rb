class AddTableFeatures < ActiveRecord::Migration
  def change
    create_table :features do|t|
      t.string :name
      t.integer :limit
      t.references :plan

      t.timestamps null: false
    end
    add_index :features, :plan_id
  end
end
