class Airport < ActiveRecord::Base
  has_many :fights
  has_many :bookings
  
  def full_string
     self.name + ' Airport (' + self.iata_code + '), ' + self.country
  end
end
