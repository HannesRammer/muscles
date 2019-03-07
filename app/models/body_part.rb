class BodyPart < ApplicationRecord

  has_many :exercise_to_muscles,  -> { order 'id asc' }
  has_many :muscles, :through => :exercise_to_muscles
  #has_many :primary_muscles, -> { where('exercise_to_muscles.active:', true)}, through: :exercise_to_muscles
  scope :muscle_list, -> (body_part_id) { x_muscleList(body_part_id) }
  scope :primary_muscles, -> (body_part_id) { x_muscles(body_part_id,'primary') }
  scope :secondary_muscles, -> (body_part_id) { x_muscles(body_part_id,'secondary') }
  scope :antagonist_muscles, -> (body_part_id) { x_muscles(body_part_id,'antagonist') }

  def sorted_muscles
    (primary_muscles + secondary_muscles)# + antagonist_muscles)
  end

  def self.x_muscles(id,m_type)
    p=0
    s=0
    a=0
    list = []
   # bodyPart = BodyPart.find(id)
    #all_m = ExerciseToMuscle.include(Muscles).find_all_by_body_part_id(id).to_a.uniq
    all_m = ExerciseToMuscle.find_all_by_body_part_id(id).to_a.uniq

    all_occurrences = all_m
    all_occurrences.each do |o|
      p = ExerciseToMuscle.find_all_by_muscle_type_and_body_part_id_and_muscle_id('primary', id,o.id).to_a.length
      s = ExerciseToMuscle.find_all_by_muscle_type_and_body_part_id_and_muscle_id('secondary', id,o.id).to_a.length
      #  a = ExerciseToMuscle.find_all_by_muscle_type_and_body_part_id_and_muscle_id('antagonistic', self.id,o.id).length

      list << o.muscle if m_type == 'primary' && p >= s #&& p >= a
      list << o.muscle if m_type == 'secondary' && s > p #&& s > a

      #list << o if m_type == 'secondary'  #&& s > a
      #list << o if m_type == "antagonistic" && a > p && a > s
    end
    list.sort.uniq.compact
    #ExerciseToMuscle.find_all_by_muscle_type_and_body_part_id(m_type, self.id).collect { |x| x.muscle }.uniq.sort! { |t1, t2| t1.name <=> t2.name }
  end
  def self.x_muscleList(id)
    p=0
    s=0
    a=0
    list = []
    primary_muscles = []
    secondary_muscles = []
    # bodyPart = BodyPart.find(id)
    #all_m = ExerciseToMuscle.include(Muscles).find_all_by_body_part_id(id).to_a.uniq
    all_m = ExerciseToMuscle.find_all_by_body_part_id(id).to_a.uniq

    all_occurrences = all_m.uniq
    all_muscle_ids = all_m.collect {|x| x.muscle_id}.uniq

    all_muscle_ids

    pList = ExerciseToMuscle.find_all_by_muscle_type_and_body_part_id_and_muscle_ids('primary', id,all_muscle_ids).to_a#.length
    sList = ExerciseToMuscle.find_all_by_muscle_type_and_body_part_id_and_muscle_ids('secondary', id,all_muscle_ids).to_a#.length
    #t = p.collect {|x| x.muscle_id }
    all_muscle_ids.each do |muscle_id|
      p = pList.count(muscle_id)
      s = pList.count(muscle_id)
     # p = ExerciseToMuscle.find_all_by_muscle_type_and_body_part_id_and_muscle_id('primary', id,o.id).to_a.length
     # s = ExerciseToMuscle.find_all_by_muscle_type_and_body_part_id_and_muscle_id('secondary', id,o.id).to_a.length
      #  a = ExerciseToMuscle.find_all_by_muscle_type_and_body_part_id_and_muscle_id('antagonistic', self.id,o.id).length

      primary_muscles << muscle_id if p >= s  #&& p >= am_type == 'primary' &&
      secondary_muscles  << muscle_id if s > p #&& s > am_type == 'secondary' &&

      #list << o if m_type == 'secondary'  #&& s > a
      #list << o if m_type == "antagonistic" && a > p && a > s
    end
    primary_muscles.sort.uniq.compact
    secondary_muscles.sort.uniq.compact
    list = [Muscle.where('id in (?)',primary_muscles),Muscle.where('id in (?)',secondary_muscles)]
    #ExerciseToMuscle.find_all_by_muscle_type_and_body_part_id(m_type, self.id).collect { |x| x.muscle }.uniq.sort! { |t1, t2| t1.name <=> t2.name }
  end

  def x_ercise_slow
    e = ExerciseToMuscle.find_all_by_body_part_id(self.id).collect { |x| x.exercise }.to_a.uniq.compact
  end

  def x_ercise
    e = ExerciseToMuscle.find_all_by_body_part_id(self.id).collect { |x| x.exercise_id }.to_a.uniq.compact
    exercisList = Exercise.where('id in (?)',e)
    exercisList
  end


end
