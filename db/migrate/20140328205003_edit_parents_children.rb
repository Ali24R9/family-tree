class EditParentsChildren < ActiveRecord::Migration
  def change
    rename_table :parents_children, :children_parents
  end
end
