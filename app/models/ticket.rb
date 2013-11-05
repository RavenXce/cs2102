class Ticket < ActiveRecord::Base
  belongs_to :booking
  belongs_to :passenger
  has_one :seat
end
