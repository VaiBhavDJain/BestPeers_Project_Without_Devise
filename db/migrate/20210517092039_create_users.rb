class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, :unique=>true
      t.string :email
      t.string :password_digest
      t.string :token
      t.boolean :verified, :default => false
    end
    add_index :users, :email, unique: true
  end
end
