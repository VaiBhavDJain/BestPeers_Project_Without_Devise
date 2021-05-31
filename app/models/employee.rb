class Employee < Profile
    belongs_to :user
    has_one_attached :image, :dependent => :destroy
    validates :image, presence: true
end
