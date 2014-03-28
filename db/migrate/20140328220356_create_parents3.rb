class CreateParents3 < ActiveRecord::Migration
  def change
    create_table :parents, :force => true do |t|
      t.column :person_id, :integer
      t.column :child_id, :integer

      t.timestamps
    end
  end
end
