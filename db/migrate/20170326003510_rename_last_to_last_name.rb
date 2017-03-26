class RenameLastToLastName < ActiveRecord::Migration[5.0]
  def change
    rename_column :customers, :last_, :last_name
  end
end
