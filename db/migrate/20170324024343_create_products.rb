class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.references :category, foreign_key: true
      t.references :meme, foreign_key: true
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :stock
      t.string :image
      t.boolean :on_sale

      t.timestamps
    end
  end
end
