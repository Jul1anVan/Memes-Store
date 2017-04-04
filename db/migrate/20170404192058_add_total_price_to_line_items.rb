class AddTotalPriceToLineItems < ActiveRecord::Migration[5.0]
  def change
    add_column :line_items, :tota_price, :decimal
  end
end
