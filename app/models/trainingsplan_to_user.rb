class TrainingsplanToUser < ApplicationRecord
  belongs_to :user
  belongs_to :trainingsplan
end
