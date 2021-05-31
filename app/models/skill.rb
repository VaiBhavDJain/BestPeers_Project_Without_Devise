class Skill < ApplicationRecord
    has_many :employee_skills, dependent: :destroy
    has_many :users, through: :employee_skills
end
