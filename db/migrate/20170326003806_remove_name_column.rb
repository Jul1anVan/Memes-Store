class RemoveNameColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :customers, :name
  end
end
