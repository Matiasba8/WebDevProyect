class AddFromUserToReceivedMessage < ActiveRecord::Migration[6.0]
  def change
    add_reference :received_messages, :from_user, foreign_key: { to_table: :users, on_delete: :cascade}
  end
end
