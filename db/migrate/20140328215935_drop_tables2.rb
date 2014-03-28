class DropTables2 < ActiveRecord::Migration
  def change
    drop_table :children2s
    drop_table :parents2s
  end
end
