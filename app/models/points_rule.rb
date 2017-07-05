class PointsRule < ActiveRecord::Base
  validates :name, presence: true
  validates :level, numericality: { only_integer: true }
  validates :consumption, numericality: true
  validates :rate, numericality: true

end
