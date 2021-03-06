class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email
      t.string :type, null: false
      t.string :password_digest
      t.date :birthday
      t.string :phone
      t.string :state, null: false

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :phone, unique: true
  end
end
