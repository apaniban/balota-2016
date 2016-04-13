class CreateChecklists < ActiveRecord::Migration
  def change
    create_table :checklists do |t|
      t.integer :user_id
      t.integer :president_id
      t.integer :vice_president_id
      t.integer :party_list_id

      t.timestamps null: false
    end
  end
end
