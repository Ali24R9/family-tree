class CreateChildrenParents < ActiveRecord::Migration
  def change
    create_table :children_parents do |t|
      t.column :child_id, :integer
      t.column :parent_id, :integer

      t.timestamps
    end
  end
end
