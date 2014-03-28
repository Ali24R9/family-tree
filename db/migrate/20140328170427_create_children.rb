class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.column :person_id, :integer
      t.column :parent_id, :integer

      t.timestamps
    end
  end
end
