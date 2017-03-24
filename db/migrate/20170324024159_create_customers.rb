class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.references :province, foreign_key: true
      t.string :first_name
      t.string :last_
      t.string :name
      t.string :address
      t.string :city
      t.string :postal_code
      t.string :email_address

      t.timestamps
    end
  end
end
