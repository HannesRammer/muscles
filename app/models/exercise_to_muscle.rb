class ExerciseToMuscle < ApplicationRecord
  belongs_to :exercise
  belongs_to :body_part
  belongs_to :muscle
  scope :find_all_by_body_part_id, -> (body_part_id) { where("body_part_id = ? and active = ?",body_part_id,true) }
  scope :find_all_by_muscle_type_and_body_part_id_and_muscle_ids, -> (muscle_type,body_part_id,muscle_ids) { where("muscle_type = ? and body_part_id = ? and muscle_id in (?) and active = ?",muscle_type,body_part_id,muscle_ids,true) }
  scope :find_all_by_muscle_type_and_body_part_id_and_muscle_id, -> (muscle_type,body_part_id,muscle_id) { where("muscle_type = ? and body_part_id = ? and muscle_id = ? and active = ?",muscle_type,body_part_id,muscle_id,true) }
  scope :find_all_by_muscle_type_and_muscle_id, -> (muscle_type,muscle_id) { where("muscle_type = ? and muscle_id = ? and active = ?",muscle_type,muscle_id,true) }
  scope :find_all_by_exercise_id_and_muscle_type, -> (exercise_id,muscle_type) { where("exercise_id = ? and muscle_type = ?",exercise_id,muscle_type) }
  scope :find_by_exercise_id_and_body_part_id_and_muscle_id_and_muscle_type, -> (exercise_id, body_part_id,muscle_id,muscle_type) { where("exercise_id = ? and body_part_id = ? and muscle_id = ? and muscle_type = ?",exercise_id, body_part_id,muscle_id,muscle_type) }
  scope :find_by_body_part_id_and_muscle_type, -> (body_part_id,muscle_type) { where("body_part_id = ? and muscle_type = ?", body_part_id,muscle_type) }

end
