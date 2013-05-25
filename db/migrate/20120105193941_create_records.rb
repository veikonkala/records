class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :artist
      t.string :name
      t.string :genre
      t.integer :year
      t.integer :inc
      t.string :label
      t.date :added

      t.timestamps
    end
  end
end
