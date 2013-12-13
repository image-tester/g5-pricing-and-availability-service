class AddPriceUrlToUnits < ActiveRecord::Migration
  def change
    add_column :units, :price_url, :string
  end
end
