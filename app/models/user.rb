class User < ApplicationRecord
  has_one :employee , dependent: :destroy
  has_one :admin, dependent: :destroy

  has_many :employee_skills, dependent: :destroy
  has_many :skills, through: :employee_skills

  has_many :chats , dependent: :destroy 

  accepts_nested_attributes_for :employee, :admin , update_only: true

  validates :name, presence: true, length: { minimum: 4}

  VALID_EMAIL_REGEX = /\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i  # /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, presence: true, length: { maximum: 40 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

end