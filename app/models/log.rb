class Log < ApplicationRecord
  belongs_to :user
  has_many :foods
  has_many :waters
  has_many :sleeps
  has_many :workouts
  has_many :goals


  accepts_nested_attributes_for :goals, :allow_destroy => true
  accepts_nested_attributes_for :workouts, :allow_destroy => true
  accepts_nested_attributes_for :waters, :allow_destroy => true
  accepts_nested_attributes_for :foods, :allow_destroy => true
  accepts_nested_attributes_for :sleeps, :allow_destroy => true



  def log_id
    log_id = @log.id
  end
end
