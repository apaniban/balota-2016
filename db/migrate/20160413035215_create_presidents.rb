class CreatePresidents < ActiveRecord::Migration
  def change
    create_table :presidents do |t|
      t.string :name
      t.integer :party_id
      t.string :ballot_name
      t.integer :ballot_number

      t.timestamps null: false
    end

    add_index :presidents, :ballot_number, unique: true
  end
end
