class AddAddressPostalcodeCityToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :address, :string
    add_column :contacts, :postalcode, :string
    add_column :contacts, :city, :string
  end
end
