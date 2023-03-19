class Camper < ApplicationRecord
  validates :name, presence: true
  validates :age,
            inclusion: {
              in: (8..18).to_a,
              message: 'A camper must be above 18 years old',
            }
  has_many :signups
  has_many :activities, through: :signups, dependent: :destroy
end
