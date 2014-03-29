class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.column :relation, :string

    end
  end
end
