class DropTableLimit < ActiveRecord::Migration
  def up
    drop_table :limits
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
