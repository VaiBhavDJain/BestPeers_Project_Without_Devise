class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.belongs_to :user, index: { unique: true }, foreign_key: true
      t.string :type
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.integer :mob_no, :unique=>true
      t.string :address
    end
  end
end
