class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :flat, foreign_key: true
      t.boolean :status
      t.date :check_in
      t.date :check_out

      t.timestamps
    end
  end
end
