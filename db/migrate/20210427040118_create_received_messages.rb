class CreateReceivedMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :received_messages do |t|
      t.references :user, null: false, foreign_key: {on_delete: :cascade}
      t.string :purpose
      t.text :body

      t.timestamps
    end
  end
end
