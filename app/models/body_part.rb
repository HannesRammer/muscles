class BodyPart < ApplicationRecord

  has_many :exercise_to_muscles,  -> { order 'id asc' }
  has_many :muscles, :through => :exercise_to_muscles
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
    all_m = ExerciseToMuscle.find_all_by_body_part_id(id).to_a.uniq

    all_occurrences = all_m
    all_occurrences.each do |o|
      p = ExerciseToMuscle.find_all_by_muscle_type_and_body_part_id_and_muscle_id(m_type, id,o.id).to_a.length
      #s = ExerciseToMuscle.find_all_by_muscle_type_and_body_part_id_and_muscle_id('secondary', id,o.id).to_a.length
      #  a = ExerciseToMuscle.find_all_by_muscle_type_and_body_part_id_and_muscle_id('antagonistic', self.id,o.id).length

      #list << o if m_type == 'primary' && p >= s #&& p >= a
      #list << o if m_type == 'secondary' && s > p #&& s > a
      if p >= 0
        list << o.muscle #Muscle.where("id = ?",o.muscle_id).to_a[0]

      end
      #list << o if m_type == 'secondary'  #&& s > a
      #list << o if m_type == "antagonistic" && a > p && a > s
    end
    list.sort.uniq.compact
    #ExerciseToMuscle.find_all_by_muscle_type_and_body_part_id(m_type, self.id).collect { |x| x.muscle }.uniq.sort! { |t1, t2| t1.name <=> t2.name }
  end

  def x_ercise
    e = ExerciseToMuscle.find_all_by_body_part_id(self.id).collect { |x| x.exercise }.to_a.uniq.compact
    e
  end


end
