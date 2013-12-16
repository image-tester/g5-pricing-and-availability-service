class Floorplan < ActiveRecord::Base
  belongs_to :location
  validates :location, presence: true

end
