class Profile < ApplicationRecord
    # validates :mob_no, uniqueness: true

    validate :age_valid
    def age_valid
      obj1 = 12 - dob.month
      obj2 = Date.today.year - dob.year - 1
      obj3 = 12 * obj2
      obj4 = Date.today.month
      total_months = obj1 + obj2 + obj3 + obj4
      final_years = total_months / 12
      final_months = total_months % 12 

      if final_years < 18
        errors.add(:dob, "You are not eligible because your age is below 18")
      end
    end
end
