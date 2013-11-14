class Location < ActiveRecord::Base
  has_many :units, dependent: :destroy

  def to_param
    urn
  end

  def self.find(s)
    self.find_by_urn(s)
  end

end
