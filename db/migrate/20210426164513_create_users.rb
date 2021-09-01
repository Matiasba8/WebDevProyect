  class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :password
      t.string :location
      t.string :current_role
      t.string :phone_num
      t.text :bio
      t.boolean :admin

      t.timestamps
    end
  end
end
