class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|
      t.integer :to
      t.belongs_to :user, null: false, foreign_key: true
      t.text :message
      t.string :date 
      t.string :time 
    end
  end
end
