class RenameFloorplansToFloorPlans < ActiveRecord::Migration
  def self.up
    rename_table :floorplans, :floor_plans
  end
  
  def self.down
    rename_table :floor_plans, :floorplans
  end
end
