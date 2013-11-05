class Airport < ActiveRecord::Base
  has_many :fights
  has_many :bookings
end
