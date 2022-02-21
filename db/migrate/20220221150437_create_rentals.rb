class CreateRentals < ActiveRecord::Migration[6.1]
  def change
    create_table :rentals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true
      t.date :start_time
      t.date :end_time
      t.float :total_amount

      t.timestamps
    end
  end
end
