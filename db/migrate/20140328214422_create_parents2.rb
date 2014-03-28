class CreateParents2 < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.column :person_id, :integer
      t.column :child_id, :integer
    end
  end
end
