class CreatePartyLists < ActiveRecord::Migration
  def change
    create_table :party_lists do |t|
      t.string :name
      t.string :acronym
      t.integer :ballot_number

      t.timestamps null: false
    end

    add_index :party_lists, :ballot_number, unique: true
  end
end
