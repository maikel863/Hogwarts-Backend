class Appointment < ApplicationRecord
  belongs_to :teacher
  belongs_to :student

  validates :meeting_time, presnece: true
end
