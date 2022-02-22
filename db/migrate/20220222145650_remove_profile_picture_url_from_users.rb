class RemoveProfilePictureUrlFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :profile_picture_url, :string
  end
end
