class RemoveEmailAddressFromCustomers < ActiveRecord::Migration[5.0]
  def change
    remove_column :customers, :email_address
  end
end
