class ExerciseToTrainingsplan < ApplicationRecord
  belongs_to :trainingsplan
  belongs_to :exercise
end
