class RemovePhotoUrlFromOffers < ActiveRecord::Migration[6.1]
  def change
    remove_column :offers, :photo_url, :string
  end
end
