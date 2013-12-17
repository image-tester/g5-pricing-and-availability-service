class AddPositionToFloorPlans < ActiveRecord::Migration
  def change
    add_column :floor_plans, :position, :integer
  end
end
