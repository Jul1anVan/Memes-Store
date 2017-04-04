class ChangePriceToUnitPriceToLineItems < ActiveRecord::Migration[5.0]
  def change
    rename_column :line_items, :price, :unit_price
  end
end
