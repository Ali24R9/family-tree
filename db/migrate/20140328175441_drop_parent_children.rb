class DropParentChildren < ActiveRecord::Migration
  def change
    drop_table :parent_children
  end
end
