class AddRowOrderToFloorPlans < ActiveRecord::Migration
  def change
    add_column :floor_plans, :row_order, :integer
  end
end
