class ExerciseToTrainingsplan < ApplicationRecord
  belongs_to :trainingsplan
  belongs_to :exercise

  def self.switch_exercise(ettp_id_1, ettp_id_2, current_user_id)
    one = ExerciseToTrainingsplan.find_by_id(ettp_id_1)
    two = ExerciseToTrainingsplan.find_by_id(ettp_id_2)
    return false unless current_user_id == Trainingsplan.user(ettp_id_1).id && current_user_id == Trainingsplan.user(ettp_id_2).id
    x = one.exercise_id
    xrep= one.reps
    xdur= one.duration
    xpause = one.pause
    xunit = one.unit

    one.exercise_id = two.exercise_id
    one.reps = two.reps
    one.duration = two.duration
    one.pause = two.pause
    one.unit = two.unit

    two.exercise_id = x
    two.reps = xrep
    two.duration = xdur
    two.pause = xpause
    two.unit = xunit

    one.save
    two.save
  end
end
