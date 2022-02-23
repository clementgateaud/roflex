class AddAddressToOffers < ActiveRecord::Migration[6.1]
  def change
    add_column :offers, :address, :string
  end
end
