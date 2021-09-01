class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :lodging, null: false, foreign_key: {on_delete: :cascade}
      t.references :user, null: false, foreign_key: {on_delete: :cascade}
      t.date :start_date
      t.date :end_date
      t.string :daily_fee
      t.boolean :confirmation

      t.timestamps
    end
  end
end
