class EditPeople < ActiveRecord::Migration
  def change
    add_column :people, :parent_id, :integer
    add_column :people, :child_id, :integer
  end
end
