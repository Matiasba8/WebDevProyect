class CreateSecurityQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :security_questions do |t|
      t.references :user, null: false, foreign_key: {on_delete: :cascade}
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
