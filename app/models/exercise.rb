class Exercise < ApplicationRecord
  has_many :exercise_to_muscles, -> { where(active: true).order("name") }
  has_many :muscles, :through => :exercise_to_muscles
#include Muscles
  has_many :user_to_exercises,  -> { where(visible: true).order("id asc")  }
  has_many :users, :through => :user_to_exercises

  has_many :exercise_to_trainingsplans, -> { order "id asc" }
  has_many :trainingsplans, :through => :exercise_to_trainingsplans

  scope :visibleExercises, ->  { where(visible: true) }

  def primary_muscles
    self.x_muscles("primary")
  end

  def secondary_muscles
    self.x_muscles("secondary")
  end

  def antagonist_muscles
    # self.x_muscles("antagonistic")
  end

  def sorted_muscles
    (primary_muscles + secondary_muscles)# + antagonist_muscles)
  end

  def x_muscles(m_type)
    muscleIds = ExerciseToMuscle.find_all_by_exercise_id_and_muscle_type(self.id,m_type).collect { |x| x.muscle_id }
  muscles = Muscle.where("id in (?)",muscleIds)
    muscles
  end

  def self.free_exercise
    Exercise.find_all_by_exercise_type("free").sort!{|t1,t2|t1.name <=> t2.name}
  end

  def self.non_free_exercise
    Exercise.find_all_by_exercise_type("gerät").sort!{|t1,t2|t1.name <=> t2.name}
  end

  def self.load_exercises(name)
    @exercises = []
    if name == "Gerät"
      @exercises = Exercise.non_free_exercise
    elsif name == "Freigewicht"
      @exercises = Exercise.free_exercise
    else
      @exercises = Exercise.where("name LIKE ? or name LIKE ?", "%#{name}%","%#{name.downcase}%").to_a.uniq
    end
    @exercises
  end
end
