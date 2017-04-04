class RenameTotaPriceToTotalPrice < ActiveRecord::Migration[5.0]
  def change
    rename_column :line_items, :tota_price, :total_price
  end
end
