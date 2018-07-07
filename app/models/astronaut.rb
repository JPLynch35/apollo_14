class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job
  has_many :astronaut_space_missions
  has_many :space_missions, through: :astronaut_space_missions

  def self.average_age
    average(:age).floor
  end

  def alphabetize_missions
    space_missions.order(:title)
  end

  def time_in_space
    space_missions.sum(:trip_length)
  end
end
