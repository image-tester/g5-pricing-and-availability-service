class RenameUnitsToFloorplans < ActiveRecord::Migration
  def self.up
    rename_table :units, :floorplans
  end
  
  def self.down
    rename_table :floorplans, :units
  end
end
