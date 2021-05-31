class CreateEmployeeSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :employee_skills do |t|
      t.belongs_to :user
      t.belongs_to :skill
    end
  end
end
