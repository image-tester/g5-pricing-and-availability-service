class Location < ActiveRecord::Base
  has_many :floor_plans, dependent: :destroy, order: "position DESC"

  validates :urn, :name, presence: true
  validates :urn, uniqueness: true
  validates_associated :floor_plans

  def to_param
    urn
  end

  def self.find(s)
    self.find_by_urn(s)
  end

end
