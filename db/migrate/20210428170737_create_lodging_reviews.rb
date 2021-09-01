class CreateLodgingReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :lodging_reviews do |t|
      t.references :lodging, null: false, foreign_key: {on_delete: :cascade}
      t.references :user, null: false, foreign_key: {on_delete: :cascade}
      t.text :description
      t.integer :rate

      t.timestamps
    end
  end
end
