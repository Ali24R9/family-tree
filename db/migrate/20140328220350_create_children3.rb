class CreateChildren3 < ActiveRecord::Migration
  def change
    create_table :children , :force => true do |t|
      t.column :person_id, :integer
      t.column :parent_id, :integer

      t.timestamps
    end
  end
end
