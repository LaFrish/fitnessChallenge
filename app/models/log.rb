class Log < ApplicationRecord
  belongs_to :user
  has_many :foods
  has_many :waters
  has_many :sleeps
  has_many :workouts
  has_many :goals
end
