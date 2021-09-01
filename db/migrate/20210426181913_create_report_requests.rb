class CreateReportRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :report_requests do |t|
      t.references :user, null: false, foreign_key: {on_delete: :cascade}
      t.text :description

      t.timestamps
    end
  end
end
