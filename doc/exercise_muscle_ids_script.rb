exercises = Exercise.all
exercises.each do |exercise|
  primary_muscles = exercise.primary_muscle_ids
  secondary_muscles = exercise.secondary_muscle_ids
  exercise.primary_muscle_ids = primary_muscles
  exercise.secondary_muscle_ids = secondary_muscles
  exercise.save
end