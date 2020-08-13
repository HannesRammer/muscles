class Trainingsplan < ApplicationRecord
  has_many :trainingsplan_to_users, -> { order "id asc" }, :dependent => :destroy
  #has_many :users, :through => :trainingsplan_to_users
  has_many :user, :through => :trainingsplan_to_users

  has_many :exercise_to_trainingsplans, -> { order "id asc" }, :dependent => :destroy
  has_many :exercises, :through => :exercise_to_trainingsplans


  scope :same_user, -> (ettp_id1, ettp_id2, user_id) {
    same_user = false
    ettps = ExerciseToTrainingsplan.select(:trainingsplan_id).where(id: [ettp_id1, ettp_id2]).collect { |x| x.trainingsplan_id }.to_a
    if ettps[0] == ettps[1] #if same trainingsplan
      ttu = TrainingsplanToUser.where(trainingsplan_id: ettps[0], user_id:user_id).to_a
      if ttu
        same_user = true
      end
    end
    same_user
  }


end
