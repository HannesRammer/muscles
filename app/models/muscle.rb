class Muscle < ApplicationRecord
  has_many :exercise_to_muscles, -> { order "name asc" }
  has_many :body_part, :through => :exercise_to_muscles

  has_many :exercise_to_muscles, -> { where(active: true).order "name asc" }
  has_many :exercises, :through => :exercise_to_muscles

  #has_many :antagonist_exercises, :through => :antagonist_to_muscles
  # has_many :antagonist_to_muscles, -> { where(active: false).order "name asc" }

  scope :sort_by_name, -> { order "name asc" }

  def clean_name
    if self.en_name == nil
      ""

    else
      self.en_name.downcase.gsub("ß", "ss").gsub(" ", "_").gsub("Ä", "ae").gsub("ä", "ae").gsub("ö", "oe").gsub("ü", "ue").gsub("Ü", "ue").gsub("Ö", "oe")
    end

  end

  def self.all_with_pic
    where("picture_id > 0").to_a
  end

  def primary_exercises
    self.x_exercises("primary")
  end

  def secondary_exercises
    self.x_exercises("secondary")
  end

  def antagonist_exercises
    self.x_exercises("antagonistic")
  end

  def sorted_exercises
    (primary_muscles + secondary_muscles) # + antagonist_muscles)
  end

  def x_exercises(muscle_type)
    # e = ExerciseToMuscle.where("muscle_type = ? and muscle_id = ?", muscle_type, self.id).collect { |x| x.exercise_id }.to_a.uniq.compact #.uniq.sort!{|t1,t2|t1.name <=> t2.name}
    e = ExerciseToMuscle.where(muscle_type:muscle_type,muscle_id:self.id).collect { |x| x.exercise_id }.to_a.uniq.compact #.uniq.sort!{|t1,t2|t1.name <=> t2.name}
    Exercise.where("id in (?)", e).where(visible: true).order("name asc").to_a
  end

  def sort_by_clean_name
    #Muscles
  end
end
