class Tag < ApplicationRecord
  has_many :tag_to_exercise, -> { order("id") }
  has_many :exercises, :through => :tag_to_exercise
end
