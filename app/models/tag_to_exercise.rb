class TagToExercise < ApplicationRecord
  belongs_to :exercise
  belongs_to :tag

end
