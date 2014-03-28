class CreateParentsChildren < ActiveRecord::Migration
  def change
    create_table :parents_children do |t|
      t.column :parent_id, :integer
      t.column :child_id, :integer

      t.timestamps
    end
  end
end
