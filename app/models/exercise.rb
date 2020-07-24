class Exercise < ApplicationRecord
  has_many :exercise_to_muscles, -> { order("id") }
  has_many :muscles, :through => :exercise_to_muscles
  #include Muscles
  has_many :user_to_exercises, -> { order("id asc") }
  has_many :users, :through => :user_to_exercises

  #has_many :exercise_to_trainingsplans, -> { where(visible: true).order("id asc") }
  has_many :exercise_to_trainingsplans, -> { order("id asc") }
  has_many :trainingsplans, :through => :exercise_to_trainingsplans

  has_many :tag_to_exercises, -> { order("id") }
  has_many :tags, :through => :tag_to_exercises

  # has_one_attached :video
  scope :visible_exercises, -> { where(visible: true) }

  def video
    Video.find_by_id(self.default_video_id)
  end


  def selected_video(trainingsplan_id)
    ett = ExerciseToTrainingsplan.find_by_exercise_id_and_trainingsplan_id(self.id, trainingsplan_id)
    video_id = 0
    if ett
      video_id = ett.video_id
      if video_id == nil || video_id == 0 || video_id == "0"
        video_id = self.default_video_id
      end
    else
      video_id = self.default_video_id
    end
      Video.find_by_id(video_id)
  end

  def primary_muscle_ids
    list = []
    self.x_muscles("primary").each do |muscle|
      list.append(muscle.id)

    end
    list.join(",")
  end

  def secondary_muscle_ids
    list = []
    self.x_muscles("secondary").each do |muscle|
      list.append(muscle.id)

    end
    list.join(",")

  end

  def primary_muscle_names
    list = []
    self.x_muscles("primary").each do |muscle|
      list.append(muscle.en_name)

    end
    list.join(",")
  end

  def secondary_muscle_names
    list = []
    self.x_muscles("secondary").each do |muscle|
      list.append(muscle.en_name)

    end
    list.join(",")

  end

  def primary_muscles
    self.x_muscles("primary")
  end

  def secondary_muscles
    self.x_muscles("secondary")
  end

  def antagonist_muscles
    self.x_muscles("antagonistic")
  end

  def sorted_muscles
    (primary_muscles + secondary_muscles) # + antagonist_muscles)
  end

  def x_muscles(m_type)
    muscleIds = ExerciseToMuscle.find_all_by_exercise_id_and_muscle_type(self.id, m_type).collect { |x| x.muscle_id }
    muscles = Muscle.where("id in (?)", muscleIds)
    muscles
  end

  def self.free_exercise
    Exercise.where(exercise_type: "free").where(visible: true).all.to_a.sort! { |t1, t2| t1.name <=> t2.name }
  end

  def self.non_free_exercise
    Exercise.where(exercise_type: "gerät").where(visible: true).all.to_a.sort! { |t1, t2| t1.name <=> t2.name }
  end

  def self.load_exercises(name)
    @exercises = []
    if name == "Gerät"
      @exercises = Exercise.non_free_exercise
    elsif name == "Freigewicht"
      @exercises = Exercise.free_exercise
    else
      @exercises = Exercise.where("name LIKE ? or name LIKE ?", "%#{name}%", "%#{name.downcase}%").where(visible: true).to_a.uniq
    end
    @exercises
  end
end
