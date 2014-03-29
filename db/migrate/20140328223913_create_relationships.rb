class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.column :person_id, :integer
      t.column :relation_id, :integer
      t.column :relative_id, :integer

    end
  end
end
