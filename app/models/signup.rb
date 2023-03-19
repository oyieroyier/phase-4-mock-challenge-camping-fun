class Signup < ApplicationRecord
  validates :time,
            inclusion: {
              in: (0..23).to_a,
              message: 'Please enter a valid time',
            }
  belongs_to :camper
  belongs_to :activity
end
