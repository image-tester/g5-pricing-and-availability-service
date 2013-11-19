class Location < ActiveRecord::Base
  has_many :units, dependent: :destroy

  validates :urn, :name, presence: true
  validates :urn, uniqueness: true
  validates_associated :units

  def to_param
    urn
  end

  def self.find(s)
    self.find_by_urn(s)
  end

end
