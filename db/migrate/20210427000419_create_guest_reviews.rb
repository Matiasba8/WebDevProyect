class CreateGuestReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :guest_reviews do |t|
      t.string :description
      t.integer :rate
      t.references :user, null: false, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
