class CreateChecklistsSenators < ActiveRecord::Migration
  def change
    create_table :checklists_senators, id: false do |t|
      t.belongs_to :checklist, index: true
      t.belongs_to :senator, index: true
    end
  end
end
