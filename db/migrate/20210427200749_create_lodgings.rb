class CreateLodgings < ActiveRecord::Migration[6.0]
  def change
    create_table :lodgings do |t|
      t.references :user, null: false, foreign_key: true, on_delete: :cascade#{on_delete: :cascade}
      t.string :title
      t.text :description
      t.string :location
      t.text :amenities
      t.text :facilities
      t.text :equipment
      t.date :start_availability
      t.date :end_availability
      t.string :photo
      t.string :video

      t.timestamps
    end
  end
end
