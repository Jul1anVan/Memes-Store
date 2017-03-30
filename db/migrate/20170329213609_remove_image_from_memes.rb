class RemoveImageFromMemes < ActiveRecord::Migration[5.0]
  def change
    remove_column :memes, :image, :string
  end
end
