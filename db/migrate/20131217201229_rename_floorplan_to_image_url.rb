class RenameFloorplanToImageUrl < ActiveRecord::Migration
  def self.up
    rename_column :floor_plans, :floorplan, :image_url
  end
  
  def self.down
    rename_column :floor_plans, :image_url, :floorplan
  end
end
