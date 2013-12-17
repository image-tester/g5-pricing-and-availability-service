class FloorPlan < ActiveRecord::Base
  belongs_to :location
  validates :location, presence: true
  
  acts_as_list scope: :location

end
