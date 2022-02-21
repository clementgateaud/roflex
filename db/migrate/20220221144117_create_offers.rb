class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.string :name
      t.float :price
      t.string :photo_url
      t.text :description
      t.boolean :availability
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
