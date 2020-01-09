class Trainingsplan < ApplicationRecord
  has_many :trainingsplan_to_users, -> { order 'id asc' }
  has_many :users, :through => :trainingsplan_to_users

  has_many :exercise_to_trainingsplans, -> { order 'id asc' }
  has_many :exercises, :through => :exercise_to_trainingsplans
end
