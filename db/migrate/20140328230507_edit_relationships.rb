class EditRelationships < ActiveRecord::Migration
  def change
    remove_column :relationships, :relation_id
    add_column :relationships, :relation, :string
  end
end
