class EditParentId < ActiveRecord::Migration
  def change
    rename_column :people, :parent_id, :parents_id
  end
end
