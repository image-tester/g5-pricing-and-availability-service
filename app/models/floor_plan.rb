class FloorPlan < ActiveRecord::Base
  belongs_to :location
  validates :location, presence: true

end
