class AddImageToMemes < ActiveRecord::Migration[5.0]
  def change
    add_column :memes, :image, :string
  end
end
