class Location < ActiveRecord::Base

  def to_param
    urn
  end

  def self.find(s)
    self.find_by_urn(s)
  end

end
