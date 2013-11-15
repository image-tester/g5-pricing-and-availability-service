class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :title
      t.integer :available_now
      t.integer :available_soon
      t.integer :beds
      t.integer :baths
      t.integer :size
      t.integer :price
      t.integer :deposit
      t.string :floorplan

      t.timestamps
    end
  end
end
