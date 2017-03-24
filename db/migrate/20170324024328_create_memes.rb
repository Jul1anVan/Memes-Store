class CreateMemes < ActiveRecord::Migration[5.0]
  def change
    create_table :memes do |t|
      t.string :name
      t.text :top_text
      t.text :bottom_text
      t.string :image

      t.timestamps
    end
  end
end
