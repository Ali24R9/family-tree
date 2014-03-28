class DropTables < ActiveRecord::Migration
  def change
    drop_table :children
    drop_table :parents
    drop_table :children_parents
  end
end
