class CreateSenators < ActiveRecord::Migration
  def change
    create_table :senators do |t|
      t.string :name
      t.integer :party_id
      t.string :ballot_name
      t.integer :ballot_number

      t.timestamps null: false
    end

    add_index :senators, :ballot_number, unique: true
  end
end
