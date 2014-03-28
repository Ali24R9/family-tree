class EditPeople2 < ActiveRecord::Migration
  def change
    remove_column :people, :child_id
    remove_column :people, :parents_id
  end
end
