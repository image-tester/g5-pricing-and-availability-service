class Location < ActiveRecord::Base
  has_many :floorplans, dependent: :destroy

  validates :urn, :name, presence: true
  validates :urn, uniqueness: true
  validates_associated :floorplans

  def to_param
    urn
  end

  def self.find(s)
    self.find_by_urn(s)
  end

end
