class CreateReservationReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reservation_reviews do |t|
      t.references :reservation, null: false, foreign_key: {on_delete: :cascade}
      t.text :description
      t.integer :rate

      t.timestamps
    end
  end
end
